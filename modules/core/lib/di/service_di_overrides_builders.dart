// Project imports:
import 'package:core/exports/di.dart';
import 'package:core/providers.dart';
import 'package:core/services/device_info_service.dart';
import 'package:core/services/package_info_service.dart';
import 'package:core/services/permission_service.dart';
import 'package:core/services/url_launcher_service.dart';

List<Override> buildServiceDiOverrides() => [
  deviceInfoServiceProvider.overrideWith((ref) => DeviceInfoServiceImpl()),
  packageInfoServiceProvider.overrideWith((ref) => PackageInfoServiceImpl()),
  permissionServiceProvider.overrideWith((ref) => PermissionServiceImpl()),
  urlLauncherServiceProvider.overrideWith(
    (ref) => const UrlLauncherServiceImpl(),
  ),
];
