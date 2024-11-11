part of 'auth_store.dart';

class AuthState {
  final String user;
  final bool isLoading;
  final bool isShowPassword;
  final String errorMessage;
  //
  final String emailLogin;
  final String passwordLogin;

  AuthState({
    this.user = '',
    this.isLoading = false,
    this.isShowPassword = false,
    this.errorMessage = '',
    this.emailLogin = '',
    this.passwordLogin = '',
  });

  AuthState copyWith({
    String? user,
    bool? isLoading,
    bool? isShowPassword,
    String? errorMessage,
    String? emailLogin,
    String? passwordLogin,
  }) {
    return AuthState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      errorMessage: errorMessage ?? this.errorMessage,
      emailLogin: emailLogin ?? this.emailLogin,
      passwordLogin: passwordLogin ?? this.passwordLogin,
    );
  }
}
