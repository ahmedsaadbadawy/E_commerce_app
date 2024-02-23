import 'package:flutter/material.dart';

import '../../../../core/widgets/product_item.dart';
import '../../../../models/product.dart';

class FavouritesSliverGrid extends StatelessWidget {
  const FavouritesSliverGrid({
    super.key,
    required this.favouritesList,
  });

  final List<Product> favouritesList;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
        childAspectRatio: 161 / 223,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Center(
            child: ProductItem(
              product: favouritesList[index],
            ),
          );
        },
        childCount: favouritesList.length,
      ),
    );
  }
}
