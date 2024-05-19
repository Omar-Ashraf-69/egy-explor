import 'package:egy_exlpor/features/payment/presentation/manager/selecting_payment_method/selecting_payment_method_cubit.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/custom_pay_button_consumer.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/payment_methods_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodsButtomSheet extends StatelessWidget {
  const PaymentMethodsButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectingPaymentMethodCubit(),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16,
            ),
            PaymentMethodsList(),
            SizedBox(
              height: 32,
            ),
            CustomPayButtonConsumer(),
          ],
        ),
      ),
    );
  }
}
