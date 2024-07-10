import 'package:experimental_app/providers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoApp extends ConsumerWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(ToduProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("todo app"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return ListTile(
          title: Row(children: [
            Text("$value"),
          ]),
        );
      }),
      
    );
  }
}
