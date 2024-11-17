import 'package:flutter/material.dart';
import 'package:todo_flutter/common/util/todo_bottom_sheet.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("To Do List"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        body: const Placeholder(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            TodoBottomSheet().show(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
