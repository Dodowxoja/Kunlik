import 'package:flutter_bloc/flutter_bloc.dart';
part '../state/signin_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
}
