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
      throw Exception(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
