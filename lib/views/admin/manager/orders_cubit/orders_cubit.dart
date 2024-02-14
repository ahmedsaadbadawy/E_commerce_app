import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_buy/constants.dart';
import 'package:meta/meta.dart';

import '../../../../models/product.dart';
import '../../../../models/user_order.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users =
      FirebaseFirestore.instance.collection(kUsersCollection);

  List<UserOrder> usersOrdersList = [];
  final products = <Product>[];

  getOrders() async {
    emit(OrdersInitial());
    try {
      final QuerySnapshot usersSnapshot =
          await FirebaseFirestore.instance.collection('users').get();
      usersOrdersList.clear();

      for (final userDoc in usersSnapshot.docs) {
        final QuerySnapshot ordersSnapshot =
            await userDoc.reference.collection('orders').get();
        if (ordersSnapshot.docs.isNotEmpty) {
          products.clear();
          for (final orderDoc in ordersSnapshot.docs) {
            final pName = orderDoc['name'];
            final pDescription = orderDoc['description'];
            final pCategory = orderDoc['category'];
            final pQuantity = orderDoc['quantity'];
            final pPrice = double.parse(orderDoc['price'].toString());
            final pimageUrl = orderDoc['imageUrl'];
            final reviewersNum = orderDoc['reviewersNum'] ?? 0;
            final reviewsSum = orderDoc['reviewsSum'] ?? 0;
            final pRef = orderDoc.reference;
            final product = Product(
              pName: pName,
              pDescription: pDescription,
              pCategory: pCategory,
              pQuantity: pQuantity,
              pPrice: pPrice,
              pimageUrl: pimageUrl,
              reviewersNum: reviewersNum,
              reviewsSum: reviewsSum,
              pRef: pRef,
            );
            products.add(product);
          }
          UserOrder userOrder = UserOrder(
            uAddress: userDoc[kUserAddress],
            uName: userDoc[kUserName],
            uPhone: userDoc[kUserPhone],
            producsList: products,
          );

          if (!usersOrdersList.contains(userOrder)) {
            usersOrdersList.add(
              UserOrder(
                  uAddress: userDoc[kUserAddress],
                  uName: userDoc[kUserName],
                  uPhone: userDoc[kUserPhone],
                  producsList: products),
            );
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
    // log("Order list updated");
    // log(usersOrdersList.length.toString());
    emit(OrdersSuccess(usersOrdersList: usersOrdersList));
  }
}
