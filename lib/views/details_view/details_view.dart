import 'package:fast_buy/constants.dart';
import 'package:fast_buy/models/product.dart';
import 'package:fast_buy/views/user/cart/cart_view.dart';
import 'package:flutter/material.dart';
import '../../core/widgets/show_snack_bar.dart';
import 'widgets/custom_buttom_list_tile.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailsViewBody(product: product),
          isAdmin == true
              ? CustomButtomListTile(
                  product: product,
                  title: 'Edit Product',
                  icon: Icons.edit_outlined,
                  onPressed: () {},
                )
              : CustomButtomListTile(
                  product: product,
                  title: 'Add to Cart',
                  icon: Icons.shopping_bag_outlined,
                  onPressed: () {
                    total += product.pPrice;
                    cartList.add({'product': product, 'quantity': 1});
                    showSnackBar(context, 'Item added Successfully');
                  },
                ),
        ],
      ),
    );
  }
}
