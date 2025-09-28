// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core/exports/restart_app.dart';
import 'package:core/exports/router.dart';
import 'package:core/network/network/network_config.dart';
import 'package:core/services/package_info_service.dart';
import 'package:core/services/storage/local_storage/local_storage.dart';
import 'package:core/services/storage/local_storage/local_storage_key.dart';
import 'package:weather_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:weather_app/features/debug_panel/presentation/router/debug_panel_router.dart';

part 'widgets/device_preview_toggle.dart';
part 'widgets/app_version_text.dart';
part 'widgets/clear_tokens_button.dart';
part 'widgets/server_field.dart';
part 'widgets/show_alice_button.dart';

class DebugPanelScreen extends StatelessWidget {
  const DebugPanelScreen({
    required this.localStorage,
    required this.router,
    required this.packageInfoService,
    super.key,
  });

  final LocalStorage localStorage;
  final DebugPanelRouter router;
  final PackageInfoService packageInfoService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debug'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              _DevicePreviewButton(localStorage: localStorage),
              const SizedBox(height: 24),
              _ShowAliceButton(onTap: () => router.onOpenAliceInspector()),
              const SizedBox(height: 24),
              _ServerPicker(
                serverUrl:
                    localStorage.getString(LocalStorageKey.testServer.name) ??
                    NetworkConfig.devUrl.toString(),
                onChanged: (String serverUrl) {
                  localStorage.setString(
                    LocalStorageKey.testServer.name,
                    serverUrl,
                  );
                },
                onRestart: () => Restart.restartApp(),
              ),
              const SizedBox(height: 24),
              _ClearTokensButton(
                onTap: () {
                  localStorage.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      margin: const EdgeInsets.all(16).copyWith(top: 100),
                      behavior: SnackBarBehavior.floating,
                      content: const Text('Токены стёрты'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              _AppVersionText(packageInfoService: packageInfoService),
            ],
          ),
        ),
      ),
    );
  }
}
