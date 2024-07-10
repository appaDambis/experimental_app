import 'package:experimental_app/providers/valueProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoDetailPage extends ConsumerWidget {
  final int index;

  TodoDetailPage(this.index);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoProvider)[index];

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(navigationProvider.notifier).goToPage(0);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(todo.title),
            SizedBox(height: 16),
            Text(
              'Status:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(todo.isCompleted ? 'Completed' : 'Pending'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(todoProvider.notifier).toggleTodoCompletion(todo.id);
              },
              child: Text(
                  todo.isCompleted ? 'Mark as Pending' : 'Mark as Completed'),
            ),
          ],
        ),
      ),
    );
  }
}
