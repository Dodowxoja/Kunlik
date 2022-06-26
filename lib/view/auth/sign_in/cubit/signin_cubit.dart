import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlik/routes/my_routes.dart';
part '../state/signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());

  String flag = 'null';

  bool obscure = true;

  phoneCode(String v) {
    if (v == "+998") {
      flag = 'uz';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+971') {
      flag = 'ae';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+380') {
      flag = 'ua';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+90') {
      flag = 'tr';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+86') {
      flag = 'cn';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+49') {
      flag = 'de';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+44') {
      flag = 'gb';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+33') {
      flag = 'fr';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+7') {
      flag = 'kz';
      emit(SignInComplete(flagName: flag));
    } else if (v == '+1') {
      flag = 'us';
      emit(SignInComplete(flagName: flag));
    } else {
      flag = 'null';
      emit(SignInComplete(flagName: flag));
    }
  }

  securityPass(bool v) {
    obscure = v;
    emit(SignInComplete(obscureText: obscure));
  }

  
}
