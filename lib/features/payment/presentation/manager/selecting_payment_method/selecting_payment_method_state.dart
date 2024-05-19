part of 'selecting_payment_method_cubit.dart';

@immutable
sealed class SelectingPaymentMethodState {}

final class SelectingPaymentMethodInitial extends SelectingPaymentMethodState {}

final class SelectingPaymentMethodChanged extends SelectingPaymentMethodState {}
