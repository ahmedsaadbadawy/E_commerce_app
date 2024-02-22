import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/services/auth.dart';
import '../../../../../models/product.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit() : super(FavouritesInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference favourites = FirebaseFirestore.instance
      .collection(kUsersCollection)
      .doc(Auth.getUserId())
      .collection(kFavouritesCollection);

  List<Product> productsList = [];

  void getFavourites() {
    emit(FavouritesLoading());
    favourites
          .orderBy(kProductCreatedAt, descending: true)
          .snapshots()
          .listen((event) {
        productsList.clear();

        getData(event);
        emit(FavouritesSuccess(favouritesList: productsList));
      });
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
