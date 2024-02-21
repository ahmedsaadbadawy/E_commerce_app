import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../models/user_order.dart';
import 'order_item.dart';

class OrdersListViewBuilder extends StatelessWidget {
  const OrdersListViewBuilder({
    super.key,
    required this.ordersList,
  });

  final List<UserOrder> ordersList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: ordersList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            GoRouter.of(context).push(AppRouter.kOrderDetailsView,
                extra: ordersList[index]);
          },
          child: OrderItem(
            order: ordersList[index],
          ),
        );
      },
    );
  }
}
