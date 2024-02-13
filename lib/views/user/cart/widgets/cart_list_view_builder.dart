import 'package:flutter/material.dart';

import '../cart_view.dart';
import 'cart_item.dart';

class CartListViewBuilder extends StatelessWidget {
  const CartListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 113,
          width: MediaQuery.sizeOf(context).width - 40,
          child: CartItem(
            product: cartList[index]['product'],
            quantity: cartList[index]['quantity'],
            pIndex: index,
          ),
        );
      },
    );
  }
}
