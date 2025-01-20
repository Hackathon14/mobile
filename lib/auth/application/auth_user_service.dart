class RequiresRecentLoginException implements Exception {}

class DeleteAccountExeption implements Exception {
  final String message;

  DeleteAccountExeption(this.message);
}

abstract class IFirebaseAuth {
  Future<void> deleteAccount();
  Future<void> signOut();
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password});
  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password});
}

abstract class IAuthUserService {}
