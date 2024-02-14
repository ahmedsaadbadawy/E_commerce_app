import 'package:fast_buy/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kDetailsView,
                  extra: cartList[index]['product']);
            },
            child: CartItem(
              product: cartList[index]['product'],
              quantity: cartList[index]['quantity'],
              pIndex: index,
            ),
          ),
        );
      },
    );
  }
}
