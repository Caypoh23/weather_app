part of '../debug_panel_screen.dart';

class _AppVersionText extends StatelessWidget {
  const _AppVersionText({
    required this.packageInfoService,
  });

  final PackageInfoService packageInfoService;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<String>(
          future: Future.sync(packageInfoService.getAppVersionFormatted),
          builder: (context, data) => Text(
            'App version: ${data.data}',
          ),
        ),
      ),
    );
  }
}
