import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/providers.dart';

part 'session_provider.g.dart';

@riverpod
SessionProvider session(SessionRef ref) {
  return SessionProvider(auth: ref.read(firebaseAuthProvider));
}

class SessionProvider {
  const SessionProvider({required FirebaseAuth auth}) : _auth = auth;

  final FirebaseAuth _auth;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-credential':
          throw FirebaseAuthException(code: e.code, message: 'Пользователь не найден');
        case 'invalid-email':
          throw FirebaseAuthException(code: e.code, message: 'Неверный email');
        case 'too-many-requests':
          throw FirebaseAuthException(code: e.code, message: 'Слишком много попыток, попробуйте позже');
        default:
          throw FirebaseAuthException(code: e.code, message: 'Что-то пошло не так');
      }
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
