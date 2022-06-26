abstract class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoding extends DetailState {}

class DetailComplete extends DetailState {
  int count;

  DetailComplete({required this.count});
}

class DetailError extends DetailState {}
