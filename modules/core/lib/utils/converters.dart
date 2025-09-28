// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/services.dart';

// Project imports:
import 'package:core/exports/path_provider.dart';

class MyConverter {
  const MyConverter._();

  static Future<File> assetToFile(String path) async {
    var dir = await getApplicationDocumentsDirectory();
    final fileName = path.split('/').last;
    File file = File("${dir.path}/$fileName");

    var data = await rootBundle.load(path);
    var bytes = data.buffer.asUint8List();

    await file.writeAsBytes(bytes, flush: true);

    return file;
  }
}
