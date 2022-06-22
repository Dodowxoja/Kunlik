part of '../cubit/signin_cubit.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoding extends SignInState {}

class SignInComplete extends SignInState {}

class SignInError extends SignInState {}
