import 'package:flutter/material.dart';

class TodoDatePicker {
  TodoDatePicker._();

  static final _instance = TodoDatePicker._();

  factory TodoDatePicker() {
    return _instance;
  }

  Future<DateTime?> pick(
    BuildContext context, {
    required DateTime selectedDate,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 5)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
  }
}
