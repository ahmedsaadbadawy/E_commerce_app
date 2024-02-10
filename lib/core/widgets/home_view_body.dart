import 'package:flutter/material.dart';

import '../../views/user/home/widgets/app_bar_section.dart';
import 'categories_list_view.dart';
import 'products_sliver_grid.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarSection(),
              SizedBox(
                height: 16,
              ),
              CategoriesListView(),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          sliver: ProductsSliverGrid(),
        ),
      ],
    );
  }
}
