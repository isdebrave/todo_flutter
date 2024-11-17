import 'package:flutter/material.dart';

class TodoText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TodoText({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? Theme.of(context).textTheme.headlineMedium,
    );
  }
}
