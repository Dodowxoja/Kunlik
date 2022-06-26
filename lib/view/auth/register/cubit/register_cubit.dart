import 'package:flutter_bloc/flutter_bloc.dart';
part '../state/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  bool sec1 = true;
  bool sec2 = true;

  bool textCheckBox = false;

  secPass1(bool v) {
    sec1 = v;
    emit(RegisterComplete(sec1: sec1));
  }

  secPass2(bool v) {
    sec2 = v;
    emit(RegisterComplete(sec2: sec2));
  }

  etidChackBox(bool v) {
    textCheckBox = v;
    emit(RegisterComplete(textCheck: textCheckBox));
  }
}
