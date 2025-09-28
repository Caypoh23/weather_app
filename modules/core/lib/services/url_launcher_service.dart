// Dart imports:
import 'dart:async';

// Package imports:
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherService {
  FutureOr<bool> openUrl(String url);
}

class UrlLauncherServiceImpl implements UrlLauncherService {
  const UrlLauncherServiceImpl();

  @override
  FutureOr<bool> openUrl(String url) async {
    final uri = Uri.parse(url);
    final isValid = await canLaunchUrl(uri);
    if (!isValid) return false;

    return launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}
