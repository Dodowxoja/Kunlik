import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kunlik/view/splash/state/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(BuildContext context) : super(SplashInitial()) {
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => SplashComplete().nextPage(context),
    );
  }
}
