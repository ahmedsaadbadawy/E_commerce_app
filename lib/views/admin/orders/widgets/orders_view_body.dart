import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../models/user_order.dart';
import 'orders_list_view_builder.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({
    super.key,
    required this.ordersList,
  });

  final List<UserOrder> ordersList;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
       SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Orders', style: Styles.styleSemiBold32),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
      OrdersListViewBuilder(ordersList: ordersList),
    ]);
  }
}
