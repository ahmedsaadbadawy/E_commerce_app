import 'package:fast_buy/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import '../../../core/widgets/categories_list_view.dart';
import 'widgets/app_bar_section.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
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
            ),
          ),
        ],
      ),
    );
  }
}
