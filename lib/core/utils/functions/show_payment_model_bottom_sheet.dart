import 'package:egy_exlpor/features/payment/presentation/manager/checkout_cubit/checkout_cubit.dart';
import 'package:egy_exlpor/features/payment/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<dynamic> showPaymentModelBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      ),
      // borderRadius: BorderRadius.circular(18),
    ),
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => StripePaymentCubit(),
        child: const PaymentMethodsButtomSheet(),
      );
    },
  );
}
