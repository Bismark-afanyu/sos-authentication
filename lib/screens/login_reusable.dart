import 'package:authentication/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login/login_cubit.dart';


/// The `LoginForm` class is a stateless widget that displays a form for user login and listens to the
/// `LoginCubit` state for error handling.
class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == LoginStatus.error) {
          // TODO: do somthing if there is an error.
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmailInput(),
          const SizedBox(height: 8),
          PasswordInput(),
          const SizedBox(height: 8),
          LoginButton(),
          const SizedBox(height: 8),
          SignupButton(),
        ],
      ),
    );
  }
}

/// The EmailInput class is a stateless widget that builds a TextField with a prefix icon and hint text,
/// and updates the email value in the LoginCubit state using BlocBuilder.
class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(
            hintText: "Enter Email",
            hintStyle: TextStyle(fontWeight: FontWeight.bold),
            prefixIconColor: Color.fromARGB(255, 179, 20, 9),
            prefixIcon: Icon(Icons.mail),
            filled: true, 
          )
          );
      },
    );
  }
}

/// This is a Dart class for a password input field that uses the BlocBuilder to update the state of the
/// input.
class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(fontWeight: FontWeight.bold),
            prefixIconColor: Color.fromARGB(255, 179, 20, 9),
            prefixIcon: Icon(Icons.mail),
            filled: true,
            ),
        );
      },
    );
  }
}

/// The LoginButton class is a stateless widget that displays a circular progress indicator or an
/// elevated button depending on the login status, and triggers a login action when pressed.
class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status == LoginStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(400, 50),
                  backgroundColor: Colors.red[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
        ),
      ),
                onPressed: () {
                  context.read<LoginCubit>().LogInWithCredentials();
                },
                child: const Text('LOGIN'),
              );
      },
    );
  }
}

/// The SignupButton class is a stateless widget that returns an elevated button with a text 'Register
/// Now' and a navigation function to the SignupScreen.
class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // still to do
      onPressed: () => Navigator.of(context).push<void>(
        SignupScreen.route(),
      ),
      child: const Text('Register Now'),
    );
  }
}
