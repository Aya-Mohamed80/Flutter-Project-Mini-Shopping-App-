import 'package:iti_project/features/favorites/bloc/fav_event.dart';
import 'package:iti_project/features/profile/bloc/profile_bloc.dart';
import 'package:iti_project/features/profile/repo/profile_repo.dart';
import 'package:iti_project/features/favorites/bloc/fav_bloc.dart';
import 'package:iti_project/features/favorites/repo/fav_repo.dart';
import 'package:iti_project/features/auth/bloc/auth_bloc.dart';
import 'package:iti_project/features/auth/repo/auth_repo.dart';
import 'package:iti_project/features/home/bloc/home_bloc.dart';
import 'package:iti_project/features/home/repo/home_repo.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:iti_project/core/routes/app_routes.dart';
import 'package:iti_project/core/theme/theme_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final AuthRepository authRepository = AuthRepository();
  final HomeRepository homeRepository = HomeRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (_) => AuthBloc(authRepository)),
        BlocProvider<HomeBloc>(create: (_) => HomeBloc(homeRepository)),
        BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
        BlocProvider<FavBloc>(create: (_) => FavBloc(FavRepo())..add(LoadFavorites())),
        BlocProvider<ProfileBloc>(create: (_) => ProfileBloc(ProfileRepo())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            theme: theme,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.generateRoute,
          );
        },
      ),
    );
  }
}
