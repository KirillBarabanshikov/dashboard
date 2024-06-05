import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/providers/firebase_providers.dart';
import './model.dart';

part 'provider.g.dart';

@riverpod
class Drugstores extends _$Drugstores {
  @override
  Future<List<DrugstoreModel>> build() => get();

  Future<void> create(DrugstoreModel drugstore) async {
    await ref.read(firebaseFirestoreProvider).collection('drugstores').add({
      'name': drugstore.name,
      'brand': drugstore.brand,
      'region': drugstore.region,
      'city': drugstore.city,
      'address': drugstore.address,
      'description': drugstore.description,
      'createdAt': drugstore.createdAt,
    });
    ref.invalidateSelf();
  }

  Future<List<DrugstoreModel>> get() async {
    QuerySnapshot querySnapshot = await ref.read(firebaseFirestoreProvider).collection('drugstores').orderBy('createdAt', descending: true).get();
    List<DrugstoreModel> drugstores = querySnapshot.docs.map((doc) {
      return DrugstoreModel.fromJson({'id': doc.id, ...doc.data() as Map<String, Object?>});
    }).toList();
    return drugstores;
  }

  Future<void> delete(String id) async {
    await ref.read(firebaseFirestoreProvider).collection('drugstores').doc(id).delete();
    ref.invalidateSelf();
  }

  Future<void> edit(DrugstoreModel drugstore) async {
    await ref.read(firebaseFirestoreProvider).collection('drugstores').doc(drugstore.id).update({
      'name': drugstore.name,
      'brand': drugstore.brand,
      'region': drugstore.region,
      'city': drugstore.city,
      'address': drugstore.address,
      'description': drugstore.description,
    });
    ref.invalidateSelf();
  }
}
