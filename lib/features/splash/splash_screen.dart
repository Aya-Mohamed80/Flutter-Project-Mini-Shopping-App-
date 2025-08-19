import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/routes/app_routes.dart';
import 'package:iti_project/core/utiles/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightGray,
      body: Center(
        child: Text(
          AppStrings.welcomeMessage,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
