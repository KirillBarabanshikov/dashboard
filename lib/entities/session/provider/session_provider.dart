import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/providers.dart';
import '../../../shared/services/services.dart';
import '../model/model.dart';

part 'session_provider.g.dart';

@riverpod
SessionProvider session(SessionRef ref) {
  return SessionProvider(
    auth: ref.read(firebaseAuthProvider),
    firestore: ref.read(firebaseFirestoreProvider),
  );
}

class SessionProvider {
  const SessionProvider({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
  })  : _auth = auth,
        _firestore = firestore;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<UserCredential> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

      final user = await _firestore.collection('users').doc(userCredential.user?.uid).get();

      await HiveService.addSessionUser(
        SessionUser(
          uid: user['uid'],
          email: user['email'],
          role: user['role'],
          displayName: user['displayName'],
          photoUrl: user['photoUrl'],
          createdAt: user['createdAt'],
          isBlocked: user['isBlocked'],
        ),
      );

      return userCredential;
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
    await HiveService.deleteSessionUser();
    await _auth.signOut();
  }
}
