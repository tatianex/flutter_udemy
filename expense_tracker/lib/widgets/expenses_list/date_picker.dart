import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  DatePicker(
      {super.key, required this.selectedDate, required this.presentDatePicker});

  final DateTime? selectedDate;
  final void Function() presentDatePicker;
  final DateFormat formatter = DateFormat.yMd();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(selectedDate == null
            ? 'No date selected'
            : formatter.format(selectedDate!)),
        IconButton(
          onPressed: presentDatePicker,
          icon: const Icon(Icons.calendar_month),
        ),
      ],
    );
  }
}
