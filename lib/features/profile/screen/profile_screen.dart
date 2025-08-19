import 'package:iti_project/features/profile/bloc/profile_event.dart';
import 'package:iti_project/features/profile/bloc/profile_state.dart';
import 'package:iti_project/features/profile/bloc/profile_bloc.dart';
import 'package:iti_project/features/favorites/bloc/fav_event.dart';
import 'package:iti_project/features/favorites/bloc/fav_bloc.dart';
import 'package:iti_project/core/widgets/app_widgets.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/routes/app_routes.dart';
import 'package:iti_project/core/theme/theme_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 2;

  void onBottomNavTapped(int index) async {
    setState(() {
      currentIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.favorites);
        break;
      case 2:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfile());
  }

  Widget _userAvatar(String? email) {
    return CircleAvatar(
      radius: 50,
      child: Text(
        email?.substring(0, 1).toUpperCase() ?? "?",
        style: const TextStyle(fontSize: 40),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        AppStrings.profile,
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeBloc>().add(ToggleTheme()),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              context.read<FavBloc>().add(ClearFavoritesEvent());
              if (context.mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.login,
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            final user = state.user;
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _userAvatar(user?.email),
                  const SizedBox(height: 20),
                  Text(
                    "User ID: ${user?.uid ?? AppStrings.noUserId}",
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Email: ${user?.email ?? AppStrings.noemail}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: customBottomNav(currentIndex, onBottomNavTapped),
    );
  }
}
