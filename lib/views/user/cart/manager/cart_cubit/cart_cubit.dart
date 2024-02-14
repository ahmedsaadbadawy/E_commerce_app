import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/services/store.dart';
import '../../../../../models/product.dart';
import '../../cart_view.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  void cartUpdate() {
    emit(UpdatePriceSuccess());
  }

  void addOrder() {
    emit(CartInitial());
    for (var map in cartList) {
      Product product = map['product'];
      product.pQuantity = map[kProductQuantity];
      product.pPrice = map[kProductQuantity] * product.pPrice;
      Store().addOrder(product: product);
    }
    total = 0;
    cartList.clear();
    emit(AddOrderSuccess());
  }
}
