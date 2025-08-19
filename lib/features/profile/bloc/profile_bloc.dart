import 'package:iti_project/features/profile/repo/profile_repo.dart';
import 'package:iti_project/core/utiles/app_strings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo repo;

  ProfileBloc(this.repo) : super(ProfileLoading()) {
    on<LoadProfile>((event, emit) {
      try {
        final user = repo.getCurrentUser();
        emit(ProfileLoaded(user));
      } catch (e) {
        emit(ProfileError(AppStrings.failedToLoadProfile));
      }
    });
  }
}
