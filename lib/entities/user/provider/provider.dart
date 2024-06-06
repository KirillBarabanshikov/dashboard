import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_string/random_string.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/providers.dart';
import '../model/model.dart';

part 'provider.g.dart';

@riverpod
class Users extends _$Users {
  @override
  Future<List<UserModel>> build() => get();

  Future<void> create(String email, String displayName) async {
    FirebaseApp app = await Firebase.initializeApp(name: 'secondary', options: Firebase.app().options);
    String password = randomAlphaNumeric(6);
    print(password);

    UserCredential userCredential = await FirebaseAuth.instanceFor(app: app).createUserWithEmailAndPassword(email: email, password: password);

    await ref.read(firebaseFirestoreProvider).collection('users').doc(userCredential.user?.uid).set({
      'uid': userCredential.user?.uid,
      'email': email,
      'role': 'user',
      'displayName': displayName,
      'photoUrl': null,
      'createdAt': DateTime.now().millisecondsSinceEpoch,
      'isBlocked': false,
    });

    // Mailer().sendEmail(
    //   'Кирилл Барабанщиков',
    //   'lilkirill2020@gmail.com',
    //   'message',
    //   'kirill24@gmail.com',
    //   'receiverCC',
    //   const AlertDialog(
    //     title: Text("Message"),
    //     content: Text(
    //       "failed to send email",
    //       style: TextStyle(
    //         color: Colors.red,
    //       ),
    //     ),
    //   ),
    //   const AlertDialog(
    //     title: Text("Message"),
    //     content: Text(
    //       "email sent successfuly",
    //       style: TextStyle(
    //         color: Colors.green,
    //       ),
    //     ),
    //   ),
    // );

    ref.invalidateSelf();
  }

  Future<List<UserModel>> get() async {
    QuerySnapshot querySnapshot = await ref.read(firebaseFirestoreProvider).collection('users').orderBy('createdAt', descending: true).get();
    List<UserModel> users = querySnapshot.docs.map((doc) {
      print(doc.data());
      return UserModel.fromJson(doc.data() as Map<String, Object?>);
    }).toList();
    return users;
  }

  Future<void> block(String uid) async {
    await ref.read(firebaseFirestoreProvider).collection('users').doc(uid).update({'isBlocked': true});
    final prevState = await future;
    state = AsyncData(prevState.map((e) {
      if (e.uid == uid) {
        return e.copyWith(isBlocked: true);
      }
      return e;
    }).toList());
  }

  Future<void> unblock(String uid) async {
    await ref.read(firebaseFirestoreProvider).collection('users').doc(uid).update({'isBlocked': false});
    final prevState = await future;
    state = AsyncData(prevState.map((e) {
      if (e.uid == uid) {
        return e.copyWith(isBlocked: false);
      }
      return e;
    }).toList());
  }
}
