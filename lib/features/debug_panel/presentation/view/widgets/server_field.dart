part of '../debug_panel_screen.dart';

class _ServerPicker extends StatefulWidget {
  const _ServerPicker({
    required this.serverUrl,
    required this.onChanged,
    required this.onRestart,
  });

  final String? serverUrl;
  final ValueChanged<String> onChanged;
  final VoidCallback onRestart;

  @override
  State<_ServerPicker> createState() => _ServerPickerState();
}

class _ServerPickerState extends State<_ServerPicker> {
  //
  String? serverUrl;

  @override
  void initState() {
    serverUrl = widget.serverUrl;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Api:"),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButton<String>(
            value: serverUrl,
            isExpanded: true,
            items: NetworkConfig.appServers.map((item) {
              final uri = item.uri;
              final urlString = uri.toString();

              return DropdownMenuItem(
                value: urlString,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '${uri.host} (${item.name})',
                  ),
                ),
              );
            }).toList(),
            onChanged: (newServerUrl) {
              if (newServerUrl != null) {
                setState(() {
                  serverUrl = newServerUrl;
                  widget.onChanged(newServerUrl);
                });
              }
            },
          ),
        ),
        IconButton(
          onPressed: widget.onRestart,
          icon: const Icon(Icons.refresh),
        ),
      ],
    );
  }
}
