import 'package:flutter/material.dart';

import '../../models/product.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
