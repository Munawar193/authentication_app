import 'package:authentication_app/auth/models/user_model.dart';
import 'package:authentication_app/auth/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signUp({
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _auth.currentUser!.updateDisplayName(name);

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        password: password,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      UserModel user = await UserService().getUserById(
        userCredential.user!.uid,
      );
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
