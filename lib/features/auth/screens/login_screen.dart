import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_project/core/routes/app_routes.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/features/auth/bloc/auth_bloc.dart';
import 'package:iti_project/features/auth/bloc/auth_event.dart';
import 'package:iti_project/features/auth/bloc/auth_state.dart';
import 'package:iti_project/core/widgets/app_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(AppStrings.login),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false,
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return customCenteredCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                customTextField(
                  emailController,
                  AppStrings.email,
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 10),
                customTextField(
                  passwordController,
                  AppStrings.password,
                  obscureText: true,
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: 20),
                customButton(AppStrings.login, () {
                  context.read<AuthBloc>().add(
                    LoginButtonPressed(
                      emailController.text.trim(),
                      passwordController.text.trim(),
                    ),
                  );
                }),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.signup);
                  },
                  child: Text(AppStrings.dontHA),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
