import 'package:dartz/dartz.dart';
import 'package:egy_exlpor/core/errors/failure.dart';
import 'package:egy_exlpor/features/payment/data/models/payment_intent_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentDetails,
  });
}
