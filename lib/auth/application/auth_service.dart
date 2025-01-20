abstract class IAuthService {
  Future<void> signOut();

  Future<bool> login({required String email, required String password});

  Future<bool> register({required String email, required String password});
}

class AuthService implements IAuthService {
  @override
  Future<bool> login({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> register({required String email, required String password}) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
