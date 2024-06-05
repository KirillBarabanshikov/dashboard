import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/providers/firebase_providers.dart';
import './model.dart';

part 'provider.g.dart';

@riverpod
class Tasks extends _$Tasks {
  @override
  Future<List<TaskModel>> build() => get();

  Future<void> create(TaskModel drugstore) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM y', 'ru_RU').format(now);

    await ref.read(firebaseFirestoreProvider).collection('tasks').add({
      'title': drugstore.title,
      'description': drugstore.description,
      'users': drugstore.users,
      'type': drugstore.type,
      'status': 'Новая',
      'date': formattedDate,
      'createdAt': drugstore.createdAt,
    });
    ref.invalidateSelf();
  }

  Future<List<TaskModel>> get() async {
    QuerySnapshot querySnapshot = await ref.read(firebaseFirestoreProvider).collection('tasks').orderBy('createdAt', descending: true).get();
    List<TaskModel> drugstores = querySnapshot.docs.map((doc) {
      return TaskModel.fromJson({'id': doc.id, ...doc.data() as Map<String, Object?>});
    }).toList();
    return drugstores;
  }

  Future<void> delete(String id) async {
    await ref.read(firebaseFirestoreProvider).collection('tasks').doc(id).delete();
    ref.invalidateSelf();
  }

  Future<void> edit(TaskModel drugstore) async {
    await ref.read(firebaseFirestoreProvider).collection('tasks').doc(drugstore.id).update({
      'title': drugstore.title,
      'status': drugstore.status,
      'type': drugstore.type,
      'description': drugstore.description,
      'users': drugstore.users,
    });
    ref.invalidateSelf();
  }

  Future<void> editStatus(String id, String status) async {
    await ref.read(firebaseFirestoreProvider).collection('tasks').doc(id).update({
      'status': status,
    });
    ref.invalidateSelf();
  }
}
