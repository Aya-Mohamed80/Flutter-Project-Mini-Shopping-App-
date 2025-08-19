import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/utiles/app_colors.dart';
import '../../features/favorites/bloc/fav_bloc.dart';
import '../../features/favorites/bloc/fav_event.dart';
import '../../features/home/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// Product Card
Widget productCard({
  required BuildContext context,
  required Product product,
  required bool isFav,
}) {
  return SizedBox(
    height: 100,
    child: Card(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Image.network(
          product.imageUrl,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Text("\$${product.price}"),
        trailing: IconButton(
          icon: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? AppColors.red : null,
          ),
          onPressed: () {
            context.read<FavBloc>().add(ToggleFavoriteEvent(product.id));
          },
        ),
      ),
    ),
  );
}

// AppBar
PreferredSizeWidget customAppBar(
  String title, {
  List<Widget>? actions,
  bool automaticallyImplyLeading = false,
}) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    automaticallyImplyLeading: automaticallyImplyLeading,
    actions: actions,
  );
}

// Bottom Navigation Bar
Widget customBottomNav(int currentIndex, Function(int) onTap) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    onTap: onTap,
    items: const [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.home),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: AppStrings.favorites),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: AppStrings.profile),
    ],
  );
}

// ElevatedButton
Widget customButton(
  String text,
  VoidCallback onPressed, {
  double paddingHorizontal = 40,
  double paddingVertical = 15,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
    ),
    child: Text(text, style: const TextStyle(fontSize: 18)),
  );
}

// TextField
Widget customTextField(
  TextEditingController controller,
  String hintText, {
  bool obscureText = false,
  IconData? prefixIcon,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      border: const OutlineInputBorder(),
    ),
  );
}

// Centered Card
Widget customCenteredCard({required Widget child}) {
  return Center(
    child: Card(
      color: AppColors.lightGray,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: 500,
          child: child,
        ),
      ),
    ),
  );
}