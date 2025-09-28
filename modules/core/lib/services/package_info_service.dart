// Dart imports:
import 'dart:async';

// Package imports:
import 'package:package_info_plus/package_info_plus.dart';

abstract interface class PackageInfoService {
  const PackageInfoService();

  FutureOr<int> getBuildVersion();

  FutureOr<String> getAppVersion();

  FutureOr<String> getAppVersionFormatted();
}

class PackageInfoServiceImpl implements PackageInfoService {
  PackageInfoServiceImpl();

  int? _buildVersion;
  String? _appVersion;

  Future<void> _fetchData() async {
    final packageInfo = await PackageInfo.fromPlatform();
    _buildVersion = int.tryParse(packageInfo.buildNumber) ?? 1;
    _appVersion = packageInfo.version;
  }

  @override
  FutureOr<int> getBuildVersion() => _dataWrapper<int>(
        () => _buildVersion,
        _buildVersion.toString(),
      );

  @override
  FutureOr<String> getAppVersion() => _dataWrapper<String>(
        () => _appVersion,
        _appVersion.toString(),
      );

  @override
  FutureOr<String> getAppVersionFormatted() async {
    final buildVersion = await getBuildVersion();
    final appVersion = await getAppVersion();
    return '$appVersion ($buildVersion)';
  }

  FutureOr<T> _dataWrapper<T>(
    T? Function() getData,
    String paramName,
  ) async {
    if (getData() == null) {
      await _fetchData();
    }

    final newData = getData();
    if (newData != null) {
      return newData;
    } else {
      throw Exception('$paramName is not available');
    }
  }
}
