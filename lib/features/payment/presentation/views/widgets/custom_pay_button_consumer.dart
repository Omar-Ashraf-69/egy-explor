import 'package:egy_exlpor/core/utils/functions/excute_paypal_payment.dart';
import 'package:egy_exlpor/features/payment/data/models/payment_intent_input_model.dart';
import 'package:egy_exlpor/features/payment/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:egy_exlpor/features/payment/presentation/manager/checkout_cubit/checkout_states.dart';
import 'package:egy_exlpor/features/payment/presentation/manager/selecting_payment_method/selecting_payment_method_cubit.dart';
import 'package:egy_exlpor/features/payment/presentation/views/thank_you_view.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPayButtonConsumer extends StatelessWidget {
  const CustomPayButtonConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentStates>(
      listener: stripePaymentBlocListener,
      builder: (context, state) {
        return CustomPayButton(
          label: 'Continue',
          isLoading: state is StripePaymentLoadingState,
          onTap: () async {
            if (BlocProvider.of<SelectingPaymentMethodCubit>(context)
                    .selectedIndex ==
                0) {
              await BlocProvider.of<StripePaymentCubit>(context).makePayment(
                paymentDetails: const PaymentIntentInputModel(
                    currency: 'usd',
                    amount: '15',
                    customerId: 'cus_Q7ki8LMHjORSSw'),
              );
            } else {
              var transactions = getTransactions();

              excutePaypalPayment(context, transactions);
            }
          },
        );
      },
    );
  }

  void stripePaymentBlocListener(context, state) {
    if (state is StripePaymentSuccessState) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ThankYouView(),
        ),
      );
    } else if (state is StripePaymentErrorState) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error),
        ),
      );
    }
  }
}
