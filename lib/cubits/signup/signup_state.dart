part of 'signup_cubit.dart';


enum SignupStatus { initial, submitting, success, error }

/// The LoginState class is an Equatable class in Dart.
/// The `SignupState` class represents the state of a signup process, including email, password, and
/// status, and provides methods for copying and updating the state.
class SignupState extends Equatable {
  final String email;
  final String password;
  final SignupStatus status;

  const SignupState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignupState.initial() {
    return const SignupState(
      email: '',
      password: '',
      status: SignupStatus.initial,
    );
  }

  @override
  List<Object> get props => [email, password, status];

  SignupState copyWith({
    String? email,
    String? password,
    SignupStatus? status,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
