import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static late Box box;

  // Initialize Hive
  static Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox("data");
  }

  // write
  static void writeData() {
    box.put("1", "test");
    box.put("2", "test2");
  }

  // read
  static dynamic readData() {
    return box.get("1");
  }

  // delete
  static void deleteData() {
    box.delete("1");
  }
}
