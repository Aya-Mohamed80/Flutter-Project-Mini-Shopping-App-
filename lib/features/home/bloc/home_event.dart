abstract class HomeEvent {}

class LoadProducts extends HomeEvent {}

class ToggleFavorite extends HomeEvent {
  final String productId;
  ToggleFavorite(this.productId);
}

class SearchProducts extends HomeEvent {
  final String query;
  SearchProducts(this.query);
}
