import 'package:fast_buy/views/admin/manager/orders_cubit/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../models/user_order.dart';
import 'widgets/orders_view_body.dart';

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
            body: OrdersViewBody(ordersList: ordersList),
          ),
        );
      },
    );
  }
}
