part of 'favourites_cubit.dart';

@immutable
sealed class FavouritesState {}

final class FavouritesInitial extends FavouritesState {}

final class FavouritesLoading extends FavouritesState {}

final class FavouritesSuccess extends FavouritesState {
  final List<Product> favouritesList;

  FavouritesSuccess({required this.favouritesList});
}
