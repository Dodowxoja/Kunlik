import 'package:kunlik/view/screens/cart/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int count = 1;
  int count2 = 1;

  plus(int i) {
    count += i;
    emit(CartComplete(count: count));
  }

  minus(int i) {
    if (count == 0) {
      count = 0;
    } else {
      count -= i;
    }
    emit(CartComplete(count: count));
  }

  plus2(int i) {
    count2 += i;
    emit(CartComplete(count: count2));
  }

  minus2(int i) {
    if (count2 == 0) {
      count2 = 0;
    } else {
      count2 -= i;
    }
    emit(CartComplete(count: count2));
  }
}
