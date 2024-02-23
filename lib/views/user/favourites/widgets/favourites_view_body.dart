import 'package:fast_buy/models/product.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import 'favourites_sliver_grid.dart';

class FavouritesViewBody extends StatelessWidget {
  const FavouritesViewBody({
    super.key,
    required this.favouritesList,
  });

  final List<Product> favouritesList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Favourites', style: Styles.styleSemiBold32),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        sliver: FavouritesSliverGrid(favouritesList: favouritesList),
      ),
    ]);
  }
}
