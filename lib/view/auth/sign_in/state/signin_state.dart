part of '../cubit/signin_cubit.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoding extends SignInState {}

class SignInComplete extends SignInState {
  String? flagName;

  SignInComplete({required this.flagName,});
}

class SignInError extends SignInState {}
