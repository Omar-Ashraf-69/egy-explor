import 'package:egy_exlpor/core/utils/api_keys.dart';
import 'package:egy_exlpor/core/utils/api_service.dart';
import 'package:egy_exlpor/features/payment/data/models/customer_model/customer_model.dart';
import 'package:egy_exlpor/features/payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:egy_exlpor/features/payment/data/models/intent_paymentsheet_input_model.dart';
import 'package:egy_exlpor/features/payment/data/models/payment_init_model/payment_init_model.dart';
import 'package:egy_exlpor/features/payment/data/models/payment_intent_input_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  StripeServices(this.apiService);
  final ApiService apiService;
  String baseUrl = 'https://api.stripe.com/v1/';
  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel payment}) async {
    Map<String, dynamic> response = await apiService.post(
      url: '${baseUrl}payment_intents',
      body: payment.toJson(),
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secertKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      token: ApiKeys.secertKey,
    );
    return PaymentIntentModel.fromJson(response);
  }

  Future<void> initPaymentSheet({
    required IntentPaymentsheetInputModel paymentModel,
  }) async {
    // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Example Demo',
        paymentIntentClientSecret: paymentModel.clientSecret,
        // Customer keys
        customerEphemeralKeySecret: paymentModel.ephemeralKeySecert,
        customerId: paymentModel.customerId,
      ),
    );
  }

  // 3. display payment sheet
  Future<void> makePayment({
    required PaymentIntentInputModel paymentDetails,
  }) async {
    PaymentIntentModel paymentIntent =
        await createPaymentIntent(payment: paymentDetails);
    EphemeralKeyModel ephemeralKey =
        await createEphemeralKey(customerId: paymentDetails.customerId);
    await initPaymentSheet(
      paymentModel: IntentPaymentsheetInputModel(
          customerId: paymentDetails.customerId,
          clientSecret: paymentIntent.clientSecret!,
          ephemeralKeySecert: ephemeralKey.secret!),
    );
    await Stripe.instance.presentPaymentSheet();
  }

  Future<CustomerModel> createCustomer() async {
    Map<String, dynamic> response = await apiService.post(
      url: '${baseUrl}customers',
      body: {
        'customer': 'cus_Q7ki8LMHjORSSw',
      },
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secertKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      token: ApiKeys.secertKey,
    );
    return CustomerModel.fromJson(response);
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    Map<String, dynamic> response = await apiService.post(
      url: '${baseUrl}ephemeral_keys',
      body: {'customer': customerId},
      token: ApiKeys.secertKey,
      headers: {
        'Stripe-Version': '2024-04-10',
        'Authorization': 'Bearer ${ApiKeys.secertKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return EphemeralKeyModel.fromJson(response);
  }
}
