import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String pName;
  double pPrice;
  final String pDescription;
  final String pCategory;
  final String pimageUrl;
  int pQuantity;
  final int? reviewersNum;
  final int? reviewsSum;
  // final pRef = db.collection("products").doc("xxxxx");
  // var doc = await pRef?.snapshots().first;
  //print(doc?[kProductName]);
  final DocumentReference? pRef;

  Product({
    required this.pName,
    required this.pPrice,
    required this.pDescription,
    required this.pCategory,
    required this.pQuantity,
    this.reviewersNum,
    this.reviewsSum,
    this.pRef,
    required this.pimageUrl,
  });
}
