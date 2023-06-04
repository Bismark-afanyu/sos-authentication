import 'package:authentication/cubits/signup/signup_cubit.dart';
import 'package:authentication/screens/signup_reusable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../repositories/auth_repository.dart';

/// The SignupScreen class displays a registration screen with a gradient background and a form for
/// users to sign up, using a SignupCubit and SignupForm.
class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SignupScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 171, 16, 5),
                Color.fromARGB(255, 234, 57, 44),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(75),
                  bottomRight: Radius.circular(75)),
            ),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 90, 0.0, 0),
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocProvider<SignupCubit>(
              create: (_) => SignupCubit(context.read<AuthRepository>()),
              child: const SignupForm(),
            ),
          ),
        ],
      ),
    ));
  }
}

/// The SignupForm class is a stateless widget that displays a form for users to input their full name,
/// phone number, email, and password, and includes a SignupButton.
class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state.status == SignupStatus.error) {
          // TODO: do something
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FullName(),
          const SizedBox(height: 8),
          Phone(),
          const SizedBox(height: 8),
          EmailInput(),
          const SizedBox(height: 8),
          PasswordInput(),
          const SizedBox(height: 8),
          SignupButton(),
        ],
      ),
    );
  }
}

