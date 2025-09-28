// Dart imports:
import 'dart:io';

// Project imports:
import 'package:core/exports/network.dart';
import 'package:core/services/storage/language_storage/language_storage.dart';

class LangInterceptor extends QueuedInterceptor {
  LangInterceptor({required LanguageStorage languageStorage})
    : _languageStorage = languageStorage;

  final LanguageStorage _languageStorage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final lang = await _languageStorage.readLanguage();

    if (lang != null && lang.isNotEmpty) {
      options.headers.addAll({HttpHeaders.acceptLanguageHeader: lang});
    }
    super.onRequest(options, handler);
  }
}
