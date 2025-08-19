import 'package:flutter/material.dart';
import 'package:iti_project/features/auth/screens/login_screen.dart';
import 'package:iti_project/features/auth/screens/signup_screen.dart';
import 'package:iti_project/features/favorites/screen/fav_screen.dart';
import 'package:iti_project/features/home/screen/home_screen.dart';
import 'package:iti_project/features/profile/screen/profile_screen.dart';
import 'package:iti_project/features/splash/splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String favorites = '/favorites';
  static const String notFound = '"Page Not Found"';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case favorites:
        return MaterialPageRoute(builder: (_) => FavoritesScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text(AppRoutes.notFound))));
    }
  }
}
