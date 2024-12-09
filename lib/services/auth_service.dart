import 'package:firebase_auth/firebase_auth.dart';

Future<void> signUpWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(userCredential.user);
  } on FirebaseAuthException catch (e) {
    print(e);
    // Handle exceptions, e.g., weak password, invalid email, etc.
  }
}

Future<void> signInWithEmailAndPassword(String email, String password) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    // Handle exceptions, e.g., wrong password, user not found, etc.
  }
}
