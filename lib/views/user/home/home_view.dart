import 'package:fast_buy/views/user/cart/cart_view.dart';
import 'package:fast_buy/views/user/favourites/favourites_view.dart';
import 'package:fast_buy/views/user/favourites/manager/favourites_cubit/favourites_cubit.dart';
import 'package:fast_buy/views/user/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants.dart';
import '../../../core/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  final screens = [
    const HomeViewBody(),
    BlocProvider(
      create: (context) => FavouritesCubit(),
      child: const FavouritesView(),
    ),
    const CartView(),
    const ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: width < 380 ? 26 : 32,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            activeIcon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heart),
            label: 'Favourites',
            activeIcon: Icon(FontAwesomeIcons.solidHeart),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
            activeIcon: Icon(Icons.shopping_bag),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(Icons.person),
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
