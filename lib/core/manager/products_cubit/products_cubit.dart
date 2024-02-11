import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_buy/models/categories.dart';
import 'package:meta/meta.dart';

import '../../../constants.dart';
import '../../../models/product.dart';

part 'products_state.dart';

class ProductCubit extends Cubit<ProductsState> {
  ProductCubit() : super(ProductsInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference products =
      FirebaseFirestore.instance.collection(kProductsCollection);

  List<Product> productsList = [];

  getProducts(String currentCategory) {
    emit(ProductsInitial());
    if (currentCategory != categories[0]) {
      products
          .where("category", isEqualTo: currentCategory)
          .orderBy(kProductCreatedAt, descending: true)
          .snapshots()
          .listen((event) {
        productsList.clear();

        getData(event);

        emit(ProductsSuccess(products: productsList));
      });
    } else {
      products
          .orderBy(kProductCreatedAt, descending: true)
          .snapshots()
          .listen((event) {
        productsList.clear();

        getData(event);
        emit(ProductsSuccess(products: productsList));
      });
    }
  }

  void getData(QuerySnapshot<Object?> event) {
    for (var doc in event.docs) {
      productsList.add(Product(
        pName: doc[kProductName],
        pDescription: doc[kProductDescription],
        pCategory: doc[kProductCategory],
        pQuantity: doc[kProductQuantity],
        pPrice: double.parse(doc[kProductPrice].toString()),
        pimageUrl: doc[kProductImageUrl],
        reviewersNum: doc[kProductReviewersNum] ?? 0,
        reviewsSum: doc[kProductReviewsSum] ?? 0,
        pRef: doc.reference,
      ));
    }
  }
}
