import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../constants.dart';
import '../../../models/product.dart';

class AdminStore {
  
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  addProduct(Product product) {
    firestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductCategory: product.pCategory,
      kProductQuantity: product.pQuantity,
      kProductPrice: product.pPrice,
      kProductCreatedAt: DateTime.now(),
      kProductReviewersNum: product.reviewersNum?? 0,
      kProductReviewsSum: product.reviewsSum?? 0,
      kProductImageUrl: product.pimageUrl,
    });
  }
}
