import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../../models/product.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<ProductsState> {
  ProductCubit() : super(ProductsInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  addProduct(Product product) {
    firestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductDescription: product.pDescription,
      kProductCategory: product.pCategory,
      kProductQuantity: product.pQuantity,
      kProductPrice: product.pPrice,
      kProductCreatedAt: DateTime.now(),
      kProductReviewersNum: product.reviewersNum,
      kProductReviewsSum: product.reviewsSum,
    });
  }

  CollectionReference products =
      FirebaseFirestore.instance.collection(kProductsCollection);

  List<Product> productsList = [];

  getProducts() {
    products
        .orderBy(kProductCreatedAt, descending: true)
        .snapshots()
        .listen((event) {
      productsList.clear();
      for (var doc in event.docs) {
        productsList.add(Product(
          pName: doc[kProductName],
          pDescription: doc[kProductDescription],
          pCategory: doc[kProductCategory],
          pQuantity: doc[kProductQuantity],
          pPrice: doc[kProductPrice],
          reviewersNum: doc[kProductReviewersNum],
          reviewsSum: doc[kProductReviewsSum],
          pRef: doc.reference,
        ));
      }
      emit(ProductsSuccess(products: productsList));
    });
  }
}
