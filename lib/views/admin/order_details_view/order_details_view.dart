import 'package:fast_buy/models/user_order.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'widgets/customer_info_container.dart';
import 'widgets/order_items_list_view_builder.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.order});
  final UserOrder order;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   Text(
                    'Customer Info',
                    style: TextStyle(
                      fontSize: width < 380 ? 22 : 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomerInfoContainer(order: order),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 24),
            sliver: OrderItemsListViewBuilder(producsList: order.producsList),
          ),
        ],
      ),
    );
  }
}
