import 'package:iti_project/features/home/model/product_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Product> products;
  final List<String> favorites;
  HomeLoaded({required this.products, required this.favorites});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
