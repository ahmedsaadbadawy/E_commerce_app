import 'package:fast_buy/views/user/cart/cart_view.dart';
import 'package:fast_buy/views/user/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/utils/services/store.dart';
import '../../../../core/utils/styles.dart';
import '../../../../models/product.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            for (var map in cartList) {
              Product product = map['product'];
              product.pQuantity = map[kProductQuantity];
              product.pPrice = map[kProductQuantity] * product.pPrice;
              Store().addOrder(product: product);
            }
            total = 0;
            cartList.clear();
            BlocProvider.of<CartCubit>(context).updatePrice();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Checkout',
                style: Styles.styleMedium16.copyWith(color: Colors.white),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
