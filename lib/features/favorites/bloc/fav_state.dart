abstract class FavState {}

class FavLoading extends FavState {}

class FavLoaded extends FavState {
  final List<String> favorites;
  FavLoaded(this.favorites);
}

class FavError extends FavState { 
  final String message;
  FavError(this.message);
}
