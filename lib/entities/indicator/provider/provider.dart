import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashboard/entities/indicator/indicator.dart';
import 'package:dashboard/shared/extensions/extensions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/providers/firebase_providers.dart';

part 'provider.g.dart';

@riverpod
class Indicators extends _$Indicators {
  @override
  Future<List<IndicatorModel>> build(String field) => get(field);

  Future<List<IndicatorModel>> get(String field) async {
    ref.cacheFor(const Duration(minutes: 1));

    QuerySnapshot querySnapshot = await ref.read(firebaseFirestoreProvider).collection('indicators').orderBy(field).get();

    final data = querySnapshot.docs.first.data() as Map<String, dynamic>;

    if (data[field] is List) {
      List<IndicatorModel> indicators = (data[field] as List).map((el) {
        return IndicatorModel.fromJson(el as Map<String, Object?>);
      }).toList();

      return indicators;
    } else {
      throw TypeError();
    }
  }
}
