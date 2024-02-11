import 'package:fast_buy/core/manager/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product.dart';
import 'product_item.dart';

class ProductsSliverGrid extends StatelessWidget {
  const ProductsSliverGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Product> productsList = [];

    return BlocConsumer<ProductCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsSuccess) {
          productsList = state.products;
        }
      },
      builder: (context, state) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 161 / 223,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Center(
                child: ProductItem(
                  product: productsList[index],
                ),
              );
            },
            childCount: productsList.length,
          ),
        );
      },
    );
  }
}
