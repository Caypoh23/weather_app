part of '../debug_panel_screen.dart';

class _ClearTokensButton extends StatelessWidget {
  const _ClearTokensButton({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Colors.black,
        ),
        minimumSize: WidgetStateProperty.all<Size>(
          const Size(double.infinity, 56),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      onPressed: onTap,
      child: const Text(
        'Clear tokens',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
