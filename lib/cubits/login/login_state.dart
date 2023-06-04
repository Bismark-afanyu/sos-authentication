/// This is a Dart code snippet defining the `LoginState` class and its properties and methods. The
/// `part of 'login_cubit.dart'` statement indicates that this code is part of a larger file named
/// `login_cubit.dart`. The `enum LoginStatus` defines an enumeration of possible login statuses. The
/// `LoginState` class is an `Equatable` class with three properties: `email`, `password`, and `status`.
/// It also has a factory method `initial()` that returns a `LoginState` object with default values. The
/// `copyWith()` method returns a new `LoginState` object with updated values for the specified
/// properties. The `@override` annotation indicates that the `get props` method is overriding a method
/// from the `Equatable` class.
part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

/// The LoginState class is an Equatable class in Dart.
class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;

  const LoginState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      status: LoginStatus.initial,
    );
  }

  @override
  List<Object> get props => [email, password, status];

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
