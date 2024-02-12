import 'package:fast_buy/core/utils/app_router.dart';
import 'package:fast_buy/core/utils/styles.dart';
import 'package:fast_buy/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailsView, extra: product);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImage(product: product),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.pName,
            style: Styles.styleSemiBold32.copyWith(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "EG ${product.pPrice}",
            style: Styles.styleMedium16.copyWith(
              fontSize: 12.2,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
