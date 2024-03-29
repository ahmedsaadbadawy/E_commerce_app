import 'package:fast_buy/core/manager/products_cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/categories.dart';
import '../../views/user/home/widgets/category_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({
    super.key,
  });

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (activeIndex != index) {
                      activeIndex = index;
                    }
                    BlocProvider.of<ProductCubit>(context)
                        .getProducts(categories[index]);
                  });
                },
                child: CategoryItem(
                  title: categories[index],
                  isActive: activeIndex == index,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
