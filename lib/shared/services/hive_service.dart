import 'package:hive_flutter/hive_flutter.dart';

import '../../entities/session/session.dart';

class HiveService {
  static init() async {
    await Hive.initFlutter();
    Hive.registerAdapter<SessionUser>(SessionUserAdapter());
    await Hive.openBox<SessionUser>('sessionUser');
  }

  static Future<void> addSessionUser(SessionUser sessionUser) async {
    await Hive.box<SessionUser>('sessionUser').add(sessionUser);
  }

  static SessionUser getSessionUser() {
    return Hive.box<SessionUser>('sessionUser').values.first;
  }

  static Future<void> deleteSessionUser() async {
    if (Hive.box<SessionUser>('sessionUser').values.isNotEmpty) {
      await Hive.box<SessionUser>('sessionUser').deleteAt(0);
    }
  }
}
