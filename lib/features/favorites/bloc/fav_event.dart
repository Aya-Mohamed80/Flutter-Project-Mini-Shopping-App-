abstract class FavEvent {}

class LoadFavorites extends FavEvent {}

class AddFavorite extends FavEvent {
  final String productId;
  AddFavorite(this.productId);
}

class RemoveFavorite extends FavEvent {
  final String productId;
  RemoveFavorite(this.productId);
}

class ToggleFavoriteEvent extends FavEvent {
  final String productId;
  ToggleFavoriteEvent(this.productId);
}

class ClearFavoritesEvent extends FavEvent {}
