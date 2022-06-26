part of '../cubit/register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoding extends RegisterState {}

class RegisterComplete extends RegisterState {
  bool? sec1;
  bool? sec2;
  bool? textCheck;
  RegisterComplete({this.sec1, this.sec2, this.textCheck});
}

class RegisterError extends RegisterState {}
