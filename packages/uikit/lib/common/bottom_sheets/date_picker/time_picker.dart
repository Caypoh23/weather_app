// Flutter imports:
import 'package:flutter/cupertino.dart';

// Project imports:
import 'package:weather_uikit/components/buttons/button.dart';
import 'package:weather_uikit/theme/app_typography_theme_data.dart';
import 'package:weather_uikit/theme/color_theme_data.dart';

const _itemExtent = 34.0;

class TimePickerSheet extends StatefulWidget {
  const TimePickerSheet({required this.buttonText, this.initialDateTime, this.onTimeSelected, super.key});

  final String buttonText;

  final DateTime? initialDateTime;
  final void Function(DateTime)? onTimeSelected;

  @override
  State<TimePickerSheet> createState() => _TimePickerSheetState();
}

class _TimePickerSheetState extends State<TimePickerSheet> {
  late DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = widget.initialDateTime ?? DateTime.now();
  }

  void _updateState() => {if (mounted) setState(() {})};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).copyWith().size.height / 5,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: context.titleTextStyle.title3),
              barBackgroundColor: context.surfaceColors.primary,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CupertinoDatePicker(
                  use24hFormat: true,
                  itemExtent: _itemExtent,
                  onDateTimeChanged: (date) {
                    dateTime = date;
                    _updateState();
                  },
                  selectionOverlayBuilder: (_, {required selectedIndex, required columnCount}) {
                    return const SizedBox.shrink();
                  },
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: widget.initialDateTime,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  height: _itemExtent,
                  child: IgnorePointer(
                    ignoring: true,
                    child: Container(
                      decoration: BoxDecoration(
                        color: CupertinoColors.tertiarySystemFill,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Button(onTap: _onSelect, text: widget.buttonText, margin: const EdgeInsets.symmetric(vertical: 8)),
      ],
    );
  }

  void _onSelect() {
    widget.onTimeSelected?.call(dateTime);
    Navigator.of(context).pop(dateTime);
  }
}
