import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/categories.dart';
import '../../views/user/home/widgets/app_bar_section.dart';
import '../manager/products_cubit/products_cubit.dart';
import 'categories_list_view.dart';
import 'products_sliver_grid.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {

  @override
  void initState() {
    BlocProvider.of<ProductCubit>(context).getProducts(categories[0]);
    super.initState();
  }
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
