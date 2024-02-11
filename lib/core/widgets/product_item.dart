import 'package:fast_buy/core/utils/styles.dart';
import 'package:fast_buy/models/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
  });

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 174,
            width: 161,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0,
                  offset: const Offset(10, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                product.pimageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
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
