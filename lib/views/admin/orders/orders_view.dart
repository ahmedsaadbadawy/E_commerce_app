import 'package:fast_buy/views/admin/manager/orders_cubit/orders_cubit.dart';
import 'package:fast_buy/views/admin/orders/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/styles.dart';
import '../../../models/user_order.dart';

class OrdersView extends StatefulWidget {
  const OrdersView({super.key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  void initState() {
    BlocProvider.of<OrdersCubit>(context).getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<UserOrder> ordersList = [];
    return Scaffold(
      body: CustomScrollView(slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Orders', style: Styles.styleSemiBold32),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {
            if (state is OrdersSuccess) {
              ordersList = state.usersOrdersList;
            }
          },
          builder: (context, state) {
            return SliverList.builder(
              itemCount: ordersList.length,
              itemBuilder: (context, index) {
                return OrderItem(
                  order: ordersList[index],
                );
              },
            );
          },
        ),
      ]),
    );
  }
}
