import 'package:flutter/material.dart';
import 'package:todo_flutter/common/widget/todo_loading_spinner.dart';

class TodoElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool disabled;

  const TodoElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: disabled
            ? Theme.of(context).colorScheme.inverseSurface.withOpacity(0.1)
            : Theme.of(context).colorScheme.inversePrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        minimumSize: const Size(double.infinity, 0),
      ),
      child: disabled ? const TodoLoadingSpinner() : Text(text),
    );
  }
}
