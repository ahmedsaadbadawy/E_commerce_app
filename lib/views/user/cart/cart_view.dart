import 'package:fast_buy/core/utils/styles.dart';
import 'package:fast_buy/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/cart_list_view_builder.dart';
import 'widgets/checkout_button.dart';
import 'widgets/custom_text_row.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

double total = 0;
List<Map<String, dynamic>> cartList = [];

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            cartList.isEmpty
                ? const Center(
                    child: Text('Your shopping cart is empty',
                        style: TextStyle(fontSize: 23)),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomAppBar(title: 'My Cart'),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height / 2 - 50,
                          child: const CartListViewBuilder(),
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.grey[400],
                          height: 50,
                        ),
                        CustomTextRow(
                          txt1: 'Sub-total',
                          txt2: 'EG ${total.toStringAsFixed(2)}',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomTextRow(
                          txt1: 'VAT (%)',
                          txt2: 'EG 0.00',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomTextRow(
                          txt1: 'Shipping fee',
                          txt2: 'EG 80.00',
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: Colors.grey[400],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style: Styles.styleRegular16,
                            ),
                            Text('EG ${(total + 80).toStringAsFixed(2)}',
                                style: Styles.styleMedium16),
                          ],
                        )
                      ],
                    ),
                  ),
            Divider(color: Colors.grey[400]),
            const SizedBox(
              height: 10,
            ),
            const CheckoutButton(),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

