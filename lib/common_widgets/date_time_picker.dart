import 'package:apexo/services/localization/locale.dart';
import 'package:apexo/common_widgets/acrylic_button.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show showTimePicker, showDatePicker, TimeOfDay;
import 'package:intl/intl.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime initValue;
  final bool pickTime;
  final String format;
  final String buttonText;
  final IconData buttonIcon;
  final Function(DateTime value) onChange;
  const DateTimePicker({
    super.key,
    required this.initValue,
    required this.onChange,
    this.pickTime = false,
    this.format = "dd/MM/yyyy",
    this.buttonIcon = FluentIcons.time_entry,
    this.buttonText = "Change date",
  });

  @override
  State<DateTimePicker> createState() => DateTimePickerState();
}

class DateTimePickerState extends State<DateTimePicker> {
  late DateTime value;

  @override
  void initState() {
    super.initState();
    value = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pick,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withValues(alpha: 0.15)),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Txt(DateFormat(widget.format, locale.s.$code).format(value)),
            AcrylicButton(icon: widget.buttonIcon, text: widget.buttonText, onPressed: pick)
          ],
        ),
      ),
    );
  }

  pick() async {
    DateTime selected = value;

    if (widget.pickTime) {
      TimeOfDay time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay(hour: value.hour, minute: value.minute),
          ) ??
          TimeOfDay(hour: selected.hour, minute: selected.minute);
      selected = DateTime(selected.year, selected.month, selected.day, time.hour, time.minute);
    } else {
      selected = await showDatePicker(
            context: context,
            initialDate: value,
            firstDate: DateTime.now().subtract(const Duration(days: 9999)),
            lastDate: DateTime.now().add(const Duration(days: 9999)),
          ) ??
          selected;
    }

    setState(() {
      widget.onChange(selected);
      value = selected;
    });
  }
}
