import 'package:flutter/material.dart';

abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoding extends SplashState {}

class SplashComplete extends SplashState {
  nextPage(BuildContext context) =>
    Navigator.pushNamedAndRemoveUntil(context, '/sign_in', (route) => false);
}

class SplashError extends SplashState {}
