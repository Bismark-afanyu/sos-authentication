// full name authentication
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/signup/signup_cubit.dart';

/// This is a Flutter class that builds a text field for entering a password and updates the state of a
/// SignupCubit when the password is changed.
class FullName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.email,
      builder: (context, state) {
        return TextField(
          obscureText: true,
          onChanged: (password) {
            context.read<SignupCubit>().passwordChanged(password);
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

// phone number aunthenticaation
/// This is a Flutter class that builds a password TextField widget with BlocBuilder for a signup form.
class Phone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.email,
      builder: (context, state) {
        return TextField(
          obscureText: true,
          onChanged: (password) {
            context.read<SignupCubit>().passwordChanged(password);
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

/// This is a Flutter/Dart class that creates an email input field with a prefix icon and validation
/// using the BlocBuilder widget.
class EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<SignupCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(
            hintText: "Email",
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

/// The above code defines two classes, PasswordInput and SignupButton, which are used in a Flutter app
/// to build a password input field and a signup button respectively, with the help of a SignupCubit and
/// SignupState.
class PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          obscureText: true,
          onChanged: (password) {
            context.read<SignupCubit>().passwordChanged(password);
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

/// The SignupButton class is a stateless widget that displays a circular progress indicator or an
/// elevated button based on the current state of the SignupCubit.
/// The SignupButton class is a stateless widget that displays a circular progress indicator or an
/// elevated button based on the current state of the SignupCubit.
class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return state.status == SignupStatus.submitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                // still to do
                onPressed: () {
                  context.read()<SignupCubit>().SignupFormsubmitted();
                },
                child: const Text('Signup'),
              );
      },
    );
  }
}
