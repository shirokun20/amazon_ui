part of 'auth_store.dart';

abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {}

class AuthSetDataEvent extends AuthEvent {
  final String value;
  final String key;
  AuthSetDataEvent({required this.value, required this.key});
}

class AuthSetShowPasswordEvent extends AuthEvent {
  final bool value;
  AuthSetShowPasswordEvent({required this.value});
}

class AuthLogoutEvent extends AuthEvent {}
