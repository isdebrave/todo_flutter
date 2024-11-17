import 'package:flutter/material.dart';
import 'package:todo_flutter/common/util/todo_date_picker.dart';
import 'package:todo_flutter/common/widget/button/todo_icon_button.dart';
import 'package:todo_flutter/common/widget/todo_text.dart';

class TodoCalendarButton extends StatelessWidget {
  final DateTime selectedDate;
  final String Function(DateTime date) dateTimeToString;
  final void Function(DateTime date) dateHandler;
  final bool disabled;

  const TodoCalendarButton({
    super.key,
    required this.selectedDate,
    required this.dateTimeToString,
    required this.dateHandler,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TodoText(
          text: dateTimeToString(selectedDate),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        TodoIconButton(
          onPressed: disabled
              ? null
              : () async {
                  final date = await TodoDatePicker().pick(
                    context,
                    selectedDate: selectedDate,
                  );

                  if (date != null) {
                    dateHandler(date);
                  }
                },
          icon: Icons.calendar_month,
        ),
      ],
    );
  }
}
