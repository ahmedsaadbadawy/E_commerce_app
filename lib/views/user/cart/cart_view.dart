import 'package:fast_buy/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/cart_list_view_builder.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

List<Map<String,dynamic>> cartList = [];

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(title: 'My Cart'),
                const SizedBox(
                  height: 10,
                ),
                cartList.isEmpty
                    ? const Center(
                        child: Text('Your shopping cart is empty',
                            style: TextStyle(fontSize: 23)),
                      )
                    : SizedBox(
                        height: MediaQuery.sizeOf(context).height / 2 - 50,
                        child: const CartListViewBuilder(),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

