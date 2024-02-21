import 'package:fast_buy/views/admin/manager/orders_cubit/orders_cubit.dart';
import 'package:fast_buy/views/admin/orders/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/utils/app_router.dart';
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

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    List<UserOrder> ordersList = [];
    return BlocConsumer<OrdersCubit, OrdersState>(
      listener: (context, state) {
        if (state is OrdersLoading) {
          isLoading = true;
        } else if (state is OrdersSuccess) {
          ordersList = state.usersOrdersList;
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
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
              SliverList.builder(
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
              ),
            ]),
          ),
        );
      },
    );
  }
}
