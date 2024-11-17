import 'package:flutter/material.dart';
import 'package:todo_flutter/common/widget/button/todo_calendar_button.dart';
import 'package:todo_flutter/common/widget/button/todo_elevated_button.dart';
import 'package:todo_flutter/common/widget/todo_text.dart';
import 'package:todo_flutter/common/widget/todo_text_form_field.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  final _focusNode = FocusNode();
  bool _disabled = false;
  DateTime _selectedDate = DateTime.now();

  String _dateTimeToString(DateTime date) {
    return "${date.year}년 ${date.month}월 ${date.day}일";
  }

  void _dateHandler(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TodoText(
                text: "날짜",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TodoCalendarButton(
                selectedDate: _selectedDate,
                dateTimeToString: _dateTimeToString,
                dateHandler: _dateHandler,
                disabled: _disabled,
              ),
            ],
          ),
          TodoTextFormField(
            controller: _controller,
            focusNode: _focusNode,
            disabled: _disabled,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return '비어 있습니다.';
              }
              return null;
            },
            hintText: "할일을 적어주세요.",
          ),
          const SizedBox(height: 10),
          TodoElevatedButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() == true) {
                FocusScope.of(context).unfocus();

                setState(() {
                  _disabled = true;
                });

                await Future.delayed(const Duration(seconds: 3));
                if (mounted) {
                  debugPrint("result => ${_dateTimeToString(_selectedDate)}");
                  debugPrint("result => ${_controller.text}");

                  Navigator.of(context).pop();
                }

                setState(() {
                  _disabled = false;
                });
              }
            },
            disabled: _disabled,
            text: "생성",
          ),
        ],
      ),
    );
  }
}
