import 'package:fast_buy/models/user_order.dart';
import 'package:flutter/material.dart';
import 'widgets/order_details_view_app_bar.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.order});
  final UserOrder order;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 24, right: 24, top: 50),
              child: Column(
                children: [
                  OrderDetailsViewAppBar(),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
