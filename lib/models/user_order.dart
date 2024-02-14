import 'package:fast_buy/models/product.dart';

class UserOrder {
  final String uName;
  final String uPhone;
  final String? uAddress;
  final List<Product> producsList;
  UserOrder({
    required this.uName,
    required this.uPhone,
    required this.uAddress,
    required this.producsList, 
  });
}
