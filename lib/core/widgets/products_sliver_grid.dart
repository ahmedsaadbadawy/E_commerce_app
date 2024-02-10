import 'package:flutter/material.dart';

import 'product_item.dart';

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        childAspectRatio: 161 / 223,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return const Center(
            child: ProductItem(),
          );
        },
        childCount: 20,
      ),
    );
  }
}
