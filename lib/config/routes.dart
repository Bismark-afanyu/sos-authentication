import 'package:authentication/blocs/app/app_bloc.dart';
import 'package:authentication/screens/home_screen.dart';
import 'package:authentication/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';

/// The function returns a list of pages based on the app status, either the home screen page if
/// authenticated or the login screen page if unauthenticated.
/// 
/// Args:
///   state (AppStatus): An enum value representing the current status of the app (either authenticated
/// or unauthenticated).
///   pages (List<Page<dynamic>>): A list of pages that can be displayed in the app view.
/// 
/// Returns:
///   A list of pages is being returned based on the value of the `state` parameter. If the `state` is
/// `authenticated`, a list containing the `HomeScreen` page is returned. If the `state` is
/// `unauthenticated`, a list containing the `LoginScreen` page is returned.
List<Page> onGenerateAppviewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeScreen.page()];
    case AppStatus.unauthenticated:
      return [LoginScreen.page()];
  }
}
