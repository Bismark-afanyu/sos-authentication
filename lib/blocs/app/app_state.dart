/// The `AppState` class defines the state of the application, including the authentication status and
/// user information.
part of 'app_bloc.dart';


/// The `AppState` class represents the state of the application, including the authentication status
/// and user information.
enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  final AppStatus status;
  final User user;
  

// name constructors

  const AppState._({
    required this.status,
    this.user =  User.empty,
  });

// showing the user is authenticated

  const AppState.authenticated(User user)
// the basic constructor
      : this._(
          status: AppStatus.authenticated,
          user: user,
        );

// showing that the user is not aunthenticated

  const AppState.unauthenticated()
      : this._(
          status: AppStatus.unauthenticated,
        );

  @override
  List<Object> get props => [status, user];
}
