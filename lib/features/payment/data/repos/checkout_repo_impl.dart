import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:egy_exlpor/core/errors/failure.dart';
import 'package:egy_exlpor/core/utils/api_service.dart';
import 'package:egy_exlpor/core/utils/stripe_services.dart';
import 'package:egy_exlpor/features/payment/data/models/payment_intent_input_model.dart';
import 'package:egy_exlpor/features/payment/data/repos/checkout_repo.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentDetails}) async {
    try {
      await StripeServices(ApiService(Dio()))
          .makePayment(paymentDetails: paymentDetails);

      return right(null);
    } catch (e) {
      if (e is StripeException) {
        return left(StripeFailure.fromStripeException(e));
        // return left(StripeFailure(error: e.error.message!));
      }
      return left(ServerFailure.fromDioError(e as DioException));
    }
  }
}
