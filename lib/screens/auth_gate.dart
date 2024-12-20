import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:school_bus/screens/home.dart';
import 'package:school_bus/screens/signin.dart';
import '../providers/authentication_providers.dart';

class AuthGate extends ConsumerStatefulWidget {
  const AuthGate({super.key});
  @override
  ConsumerState<AuthGate> createState() => AuthGateState();
}

class AuthGateState extends ConsumerState<AuthGate> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  buttonBuilder(String text, {VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);
    return authState.when(
      data: (data) {
        if (data != null) {
          return const HomeScreen();
        }
        return const SignInScreen();
      },
      loading: () => const CircularProgressIndicator(),
      error: (e, trace) {
        return const SignInScreen();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
