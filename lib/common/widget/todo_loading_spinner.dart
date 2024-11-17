import 'package:flutter/material.dart';

class TodoLoadingSpinner extends StatelessWidget {
  final double size;

  const TodoLoadingSpinner({super.key, this.size = 22.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 3,
      ),
    );
  }
}
