import 'package:logger/logger.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final _logger = Logger();

  @observable
  AuthState state = AuthState();

  @action
  Future<void> onEvent(AuthEvent event) async {
    if (event is AuthLoginEvent) {
      await login();
    } else if (event is AuthLogoutEvent) {
      await logout();
    } else if (event is AuthSetDataEvent) {
      await setData(event.key, event.value);
    } else if (event is AuthSetShowPasswordEvent) {
      await setShowPassword(  event.value);
    }
  }

  Future<void> setShowPassword(bool value) async {
    state = state.copyWith(isShowPassword: value);
  }

  Future<void> setData(String key, String value) async {
    try {
      // _logger.i('$key: $value');
      switch (key) {
        case 'emailLogin':
          state = state.copyWith(
            emailLogin: value,
          );
          break;
        case 'passwordLogin':
          state = state.copyWith(
            passwordLogin: value,
          );
          break;
      }
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
      _logger.e('Login: ${e.toString()}');
    }
  }

  Future<void> login() async {
    //
    _logger.i('Login: ${state.emailLogin}, ${state.passwordLogin}');
    //
    state = state.copyWith(isLoading: true, errorMessage: '');
    try {
      // final response = await _apiService.login(username, password);
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(user: 'login');
      // Simpan token di Shared Preferences
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true, errorMessage: '');
    try {
      await Future.delayed(const Duration(seconds: 1));
      state = state.copyWith(user: '');
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
    _logger.i('Login: ${state.isLoading}, ${state.user.length}');
  }
}
