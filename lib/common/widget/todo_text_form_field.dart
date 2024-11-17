import 'package:flutter/material.dart';

class TodoTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?) validator;
  final String hintText;
  final bool autoFocus;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool disabled;

  const TodoTextFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.validator,
    this.hintText = "",
    this.autoFocus = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autoFocus,
      focusNode: focusNode,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      readOnly: disabled,
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
    );
  }
}
