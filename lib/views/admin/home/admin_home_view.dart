import 'package:fast_buy/core/widgets/home_view_body.dart';
import 'package:fast_buy/views/admin/add_product/add_product_view.dart';
import 'package:fast_buy/views/admin/manager/orders_cubit/orders_cubit.dart';
import 'package:fast_buy/views/admin/orders/orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../user/profile/profile_view.dart';

class AdminHomeView extends StatefulWidget {
  const AdminHomeView({super.key});

  @override
  State<AdminHomeView> createState() => _AdminHomeViewState();
}

class _AdminHomeViewState extends State<AdminHomeView> {
  int index = 0;

  final screens =  [
    const HomeViewBody(),
    BlocProvider(
      create: (context) => OrdersCubit()..getOrders(),
      child: const OrdersView(),
    ),
    const AddProductView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 32),
            label: 'Home',
            activeIcon: Icon(Icons.home, size: 32),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 32),
            label: 'Orders',
            activeIcon: Icon(Icons.shopping_bag, size: 32),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, size: 32),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 32),
            label: 'Profile',
            activeIcon: Icon(Icons.person, size: 32),
          ),
        ],
        unselectedItemColor: Colors.grey[600],
        selectedItemColor: Colors.black,
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
      ),
      body: screens[index],
    );
  }
}
