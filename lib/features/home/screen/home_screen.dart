import 'package:iti_project/core/widgets/app_widgets.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../favorites/bloc/fav_bloc.dart';
import '../../favorites/bloc/fav_event.dart';
import '../../favorites/bloc/fav_state.dart';
import 'package:flutter/material.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadProducts());
    context.read<FavBloc>().add(LoadFavorites());
  }

  void onBottomNavTapped(int index) async {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.favorites);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.home),
      body: Column(
        children: [
          // Search Box
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: AppStrings.searchHint,
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (query) {
                context.read<HomeBloc>().add(SearchProducts(query));
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoaded) {
                  if (state.products.isEmpty) {
                    return const Center(child: Text(AppStrings.noProducts));
                  }
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      final favState = context.watch<FavBloc>().state;
                      final isFav =
                          favState is FavLoaded &&
                          favState.favorites.contains(product.id);
                      return productCard(
                        context: context,
                        product: product,
                        isFav: isFav,
                      );
                    },
                  );
                } else if (state is HomeError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: customBottomNav(currentIndex, onBottomNavTapped),
    );
  }
}
