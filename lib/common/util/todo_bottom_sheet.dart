import 'package:flutter/material.dart';
import 'package:todo_flutter/common/widget/todo_form.dart';

class TodoBottomSheet {
  TodoBottomSheet._();

  static final _instance = TodoBottomSheet._();

  factory TodoBottomSheet() {
    return _instance;
  }

  Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      useSafeArea: true,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 13.0,
            left: 13.0,
            right: 13.0,
            bottom: 13.0 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: const TodoForm(),
        );
      },
    );
  }
}
