import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String pName;
  final double pPrice;
  final String pDescription;
  final String pCategory;
  final String pimageUrl;
  final int pQuantity;
  final int reviewersNum;
  final int reviewsSum;
  // final alovelaceDocumentRef = db.collection("users").doc("alovelace");
  final DocumentReference pRef;

  Product({
    required this.pName,
    required this.pPrice,
    required this.pDescription,
    required this.pCategory,
    required this.pQuantity,
    required this.reviewersNum,
    required this.reviewsSum,
    required this.pRef,
    required this.pimageUrl,
  });
}
