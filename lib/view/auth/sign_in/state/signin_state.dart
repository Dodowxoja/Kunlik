part of '../cubit/signin_cubit.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoding extends SignInState {}

class SignInComplete extends SignInState {
  String? flagName;
  bool? obscureText;

  SignInComplete({this.flagName, this.obscureText});
}

class SignInError extends SignInState {}
