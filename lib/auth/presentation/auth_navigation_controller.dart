import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_eco_mobile/auth/application/auth_user_service.dart';

enum AuthNavigationState {
  loading,
  loggedIn,
  loggedOut,
}

class AuthNavigationController extends Cubit<AuthNavigationState> {
  AuthNavigationController(
    this._authUserService,
  ) : super(AuthNavigationState.loading) {
    _load();
  }

  final IAuthUserService _authUserService;

  void _load() {}

  @override
  Future<void> close() {
    authStateChangeSubscription?.cancel();
    return super.close();
  }

  StreamSubscription? authStateChangeSubscription;
}
