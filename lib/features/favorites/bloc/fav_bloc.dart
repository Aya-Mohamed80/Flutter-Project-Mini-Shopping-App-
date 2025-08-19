import 'package:iti_project/features/favorites/repo/fav_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fav_event.dart';
import 'fav_state.dart';

class FavBloc extends Bloc<FavEvent, FavState> {
  final FavRepo repo;

  FavBloc(this.repo) : super(FavLoading()) {
    on<LoadFavorites>((event, emit) {
      emit(FavLoaded(List.from(repo.getFavorites())));
    });

    on<AddFavorite>((event, emit) {
      repo.add(event.productId);
      emit(FavLoaded(List.from(repo.getFavorites())));
    });

    on<RemoveFavorite>((event, emit) {
      repo.remove(event.productId);
      emit(FavLoaded(List.from(repo.getFavorites())));
    });

    on<ToggleFavoriteEvent>((event, emit) {
      repo.toggle(event.productId);
      emit(FavLoaded(List.from(repo.getFavorites())));
    });

    on<ClearFavoritesEvent>((event, emit) {
      repo.clearAll(); 
      emit(FavLoaded([]));
    });
  }
}
