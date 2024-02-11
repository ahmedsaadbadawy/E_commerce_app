import 'package:fast_buy/models/product.dart';
import 'package:flutter/material.dart';
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
          CustomButtomListTile(product: product),
        ],
      ),
    );
  }
}
