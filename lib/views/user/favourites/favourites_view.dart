import 'package:fast_buy/models/product.dart';
import 'package:fast_buy/views/user/favourites/manager/favourites_cubit/favourites_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'widgets/favourites_view_body.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void initState() {
    BlocProvider.of<FavouritesCubit>(context).getFavourites();
    super.initState();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    List<Product> favouritesList = [];

    return BlocConsumer<FavouritesCubit, FavouritesState>(
      listener: (context, state) {
        if (state is FavouritesLoading) {
          isLoading = true;
        } else if (state is FavouritesSuccess) {
          favouritesList = state.favouritesList;
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Scaffold(
            body: FavouritesViewBody(
              favouritesList: favouritesList,
            ),
          ),
        );
      },
    );
  }
}
