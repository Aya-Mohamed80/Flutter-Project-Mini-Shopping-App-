import 'package:iti_project/core/widgets/app_widgets.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../favorites/bloc/fav_event.dart';
import '../../favorites/bloc/fav_state.dart';
import '../../home/model/product_model.dart';
import '../../favorites/bloc/fav_bloc.dart';
import '../../home/bloc/home_state.dart';
import '../../home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  int currentIndex = 1;

  void onBottomNavTapped(int index) {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 1:
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<FavBloc>().add(LoadFavorites());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.favorites),
      body: BlocBuilder<FavBloc, FavState>(
        builder: (context, state) {
          if (state is FavLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavLoaded) {
            if (state.favorites.isEmpty) {
              return const Center(child: Text(AppStrings.noFavorites));
            }
            return ListView.builder(
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                final productId = state.favorites[index];
                final homeState = context.watch<HomeBloc>().state;
                Product? product;
                if (homeState is HomeLoaded) {
                  try {
                    product = homeState.products.firstWhere(
                      (prod) => prod.id == productId,
                    );
                  } catch (_) {
                    product = null;
                  }
                }
                if (product == null) {
                  return const SizedBox();
                }
                final isFav = true;
                return productCard(
                  context: context,
                  product: product,
                  isFav: isFav,
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: customBottomNav(currentIndex, onBottomNavTapped),
    );
  }
}
