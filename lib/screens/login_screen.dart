import 'package:authentication/cubits/login/login_cubit.dart';
import 'package:authentication/repositories/auth_repository.dart';
import 'package:authentication/screens/login_reusable.dart';
import 'package:authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// The LoginScreen class is a stateless widget that displays a login screen with email and password
/// inputs, a login button, and a signup button.
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static Page page() => const MaterialPage<void>(child: LoginScreen());

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
                ],begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(75),
                    bottomRight: Radius.circular(75)),
              ),
              height: 250,
              child:  const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 80, 0.0, 0),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
           EmailInput(),
           PasswordInput(),
           LoginButton(),
           Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Don\'t Have Any Account?'),
                SignupButton(),
              ],
            ),
           )
          ],
        ),
      ),
    );
  }
}

