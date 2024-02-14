import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_buy/core/utils/services/auth.dart';
import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../models/user_info.dart';

class Store {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  addProduct(Product product) {
    firestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductCategory: product.pCategory,
      kProductQuantity: product.pQuantity,
      kProductPrice: product.pPrice,
      kProductCreatedAt: DateTime.now(),
      kProductReviewersNum: product.reviewersNum ?? 0,
      kProductReviewsSum: product.reviewsSum ?? 0,
      kProductImageUrl: product.pimageUrl,
    });
  }

  void addUserInfo(UserInfo userInfo, String uid) {
    firestore.collection(kUsersCollection).doc(uid).set({
      kUserName: userInfo.uName,
      kUserPhone: userInfo.uPhone,
      kUserAddress: userInfo.uAddress,
    });
  }

  void addOrder({required Product product}) {
    firestore
        .collection(kUsersCollection)
        .doc(Auth.getUserId())
        .collection(kOrdersCollection)
        .add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductCategory: product.pCategory,
      kProductQuantity: product.pQuantity,
      kProductPrice: product.pPrice,
      kProductCreatedAt: DateTime.now(),
      kProductReviewersNum: product.reviewersNum ?? 0,
      kProductReviewsSum: product.reviewsSum ?? 0,
      kProductImageUrl: product.pimageUrl,
    });
  }
}
