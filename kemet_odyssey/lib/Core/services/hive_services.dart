import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  static Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<void> saveData<T>({required String boxName, required T data}) async {
    var box = await Hive.openBox<T>(boxName);
    await box.add(data);
  }

  Future<List<T>> getData<T>({required String boxName}) async {
    var box = await Hive.openBox<T>(boxName);
    return box.values.toList();
  }

  Future<void> clearData({required String boxName}) async {
    var box = await Hive.openBox(boxName);
    await box.clear();
  }
}
