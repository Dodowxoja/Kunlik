abstract class AccountPasswordState {}

class AccountPasswordInitial extends AccountPasswordState {}

class AccountPasswordLoding extends AccountPasswordState {}

class AccountPasswordComplete extends AccountPasswordState {
  bool? sec1;
  bool? sec2;
  bool? sec3;

  AccountPasswordComplete({this.sec1, this.sec2, this.sec3});
}

class AccountPasswordError extends AccountPasswordState {}
