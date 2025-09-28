part of '../debug_panel_screen.dart';

class _DevicePreviewButton extends StatefulWidget {
  const _DevicePreviewButton({required this.localStorage});

  final LocalStorage localStorage;

  @override
  State<_DevicePreviewButton> createState() => _DevicePreviewButtonState();
}

class _DevicePreviewButtonState extends State<_DevicePreviewButton> {
  //
  bool _showDevicePreview = false;

  @override
  void initState() {
    super.initState();
    _showDevicePreview =
        widget.localStorage.getBool(LocalStorageKey.showDevicePreview.name) ??
        false;
  }

  void updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Text('Device Preview:')),
        uikit.Switcher(onChanged: onChanged, value: _showDevicePreview),
      ],
    );
  }

  void onChanged(bool value) {
    _showDevicePreview = value;
    widget.localStorage.setBool(LocalStorageKey.showDevicePreview.name, value);
    updateState();
  }
}
