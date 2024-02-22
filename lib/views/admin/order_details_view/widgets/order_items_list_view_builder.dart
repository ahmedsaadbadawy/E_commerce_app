import 'package:fast_buy/models/product.dart';
import 'package:fast_buy/views/admin/order_details_view/widgets/order_product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';

class OrderItemsListViewBuilder extends StatelessWidget {
  const OrderItemsListViewBuilder({
    super.key,
    required this.producsList,
  });

  final List<Product> producsList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: producsList.length,
      itemBuilder: (context, index) {
        return SizedBox(
          height: 113,
          width: MediaQuery.sizeOf(context).width - 40,
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.kDetailsView, extra: producsList[index]);
            },
            child: OrderProductItem(product: producsList[index]),
          ),
        );
      },
    );
  }
}
