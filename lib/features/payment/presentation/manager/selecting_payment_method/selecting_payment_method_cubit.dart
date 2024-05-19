import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selecting_payment_method_state.dart';

class SelectingPaymentMethodCubit extends Cubit<SelectingPaymentMethodState> {
  SelectingPaymentMethodCubit() : super(SelectingPaymentMethodInitial());
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    emit(SelectingPaymentMethodChanged());
  }
}
