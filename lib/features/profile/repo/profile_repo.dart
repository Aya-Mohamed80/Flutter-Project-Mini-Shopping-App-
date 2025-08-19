import 'package:firebase_auth/firebase_auth.dart';

class ProfileRepo {
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
