import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/firebase_providers.dart';
import '../model/model.dart';

part 'provider.g.dart';

@riverpod
class Tasks extends _$Tasks {
  @override
  Future<List<TaskModel>> build({String? displayName}) => get(displayName: displayName);

  Future<void> create(TaskModel task) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMMM y', 'ru_RU').format(now);

    await ref.read(firebaseFirestoreProvider).collection('tasks').add({
      'title': task.title,
      'description': task.description,
      'user': {'displayName': task.user.displayName, 'photoUrl': task.user.photoUrl},
      'type': task.type,
      'status': 'Новая',
      'date': formattedDate,
      'createdAt': task.createdAt,
      'displayName': task.user.displayName,
    });
    ref.invalidateSelf();
  }

  Future<List<TaskModel>> get({String? displayName}) async {
    // ref.cacheFor(const Duration(minutes: 1));
    late QuerySnapshot querySnapshot;

    if (displayName == null) {
      querySnapshot = await ref.read(firebaseFirestoreProvider).collection('tasks').orderBy('createdAt', descending: true).get();
    } else {
      querySnapshot = await ref.read(firebaseFirestoreProvider).collection('tasks').where('displayName', isEqualTo: displayName).get();
    }
    List<TaskModel> tasks = querySnapshot.docs.map((doc) {
      return TaskModel.fromJson({'id': doc.id, ...doc.data() as Map<String, Object?>});
    }).toList();

    if (displayName != null) {
      tasks.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }

    return tasks;
  }

  Future<void> delete(String id) async {
    await ref.read(firebaseFirestoreProvider).collection('tasks').doc(id).delete();
    ref.invalidateSelf();
  }

  Future<void> edit(TaskModel task) async {
    await ref.read(firebaseFirestoreProvider).collection('tasks').doc(task.id).update({
      'title': task.title,
      'status': task.status,
      'type': task.type,
      'description': task.description,
      'user': {'displayName': task.user.displayName, 'photoUrl': task.user.photoUrl},
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
