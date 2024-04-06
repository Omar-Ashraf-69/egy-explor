import 'dart:developer';

import 'package:egy_exlpor/core/managers/get_user_cubit/user_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:egy_exlpor/core/models/user.dart';
import 'package:egy_exlpor/core/services/auth.dart';

class UserCubit extends Cubit<UserState> {
  bool isLoading = true;
  UserModel? user;
  UserCubit() : super(UserInitial());

  void getUserDetails() async {
    isLoading = true;
    emit(UserLoading());
    try {
      user = await Authentication().getUserDetails();
      isLoading = false;
      emit(UserLoaded(user!));
    } catch (e) {
      log(e.toString());
      isLoading = false;
      emit(UserError("Error fetching user details"));
    }
  }
}
