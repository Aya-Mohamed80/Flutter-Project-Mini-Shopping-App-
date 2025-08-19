import 'package:iti_project/features/home/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repo/home_repo.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository;
  List<Product> allProducts = [];
  List<String> favorites = [];

  HomeBloc(this.homeRepository) : super(HomeInitial()) {
    on<LoadProducts>(_onLoadProducts);
    on<ToggleFavorite>(_onToggleFavorite);
    on<SearchProducts>(_onSearchProducts);
  }

  Future<void> _onLoadProducts(LoadProducts event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      allProducts = await homeRepository.fetchProducts();
      emit(HomeLoaded(products: allProducts, favorites: favorites));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<HomeState> emit) {
    if (favorites.contains(event.productId)) {
      favorites.remove(event.productId);
    } else {
      favorites.add(event.productId);
    }
    emit(HomeLoaded(products: allProducts, favorites: favorites));
  }

  void _onSearchProducts(SearchProducts event, Emitter<HomeState> emit) {
    final filtered = allProducts.where( (p) => p.name.toLowerCase().startsWith(event.query.toLowerCase())).toList();
    emit(HomeLoaded(products: filtered, favorites: favorites));
  }
}
