abstract class CartState {}

class CartInitial extends CartState {}

class CartLoding extends CartState {}

class CartComplete extends CartState {
  int? count;
  int? count2;

  CartComplete({this.count, this.count2});
}

class CartError extends CartState {}
