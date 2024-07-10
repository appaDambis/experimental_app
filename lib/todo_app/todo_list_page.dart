// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:experimental_app/todo_app/todo_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TodoListPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final todoAsyncValue = ref.watch(todosProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('ToDo List'),
//       ),
//       body: todoAsyncValue.when(
//         data: (todos) {
//           if (todos.isEmpty) {
//             return Center(child: Text('No todos available.'));
//           }

//           return ListView.builder(
//             itemCount: todos.length,
//             itemBuilder: (context, index) {
//               final todo = todos[index];
//               return ListTile(
//                 title: Text(todo.title),
//                 trailing: Checkbox(
//                   value: todo.isCompleted,
//                   onChanged: (bool? value) {
//                     _toggleTodoCompletion(todo);
//                   },
//                 ),
//                 onLongPress: () {
//                   _deleteTodo(todo.id);
//                 },
//               );
//             },
//           );
//         },
//         loading: () => Center(child: CircularProgressIndicator()),
//         error: (err, stack) => Center(child: Text('Error: $err')),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _addTodoDialog(context),
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   Future<void> _toggleTodoCompletion(Todo todo) async {
//     final firestore = FirebaseFirestore.instance;
//     await firestore.collection('todos').doc(todo.id).update({
//       'isCompleted': !todo.isCompleted,
//     });
//   }

//   Future<void> _deleteTodo(String id) async {
//     final firestore = FirebaseFirestore.instance;
//     await firestore.collection('todos').doc(id).delete();
//   }

//   Future<void> _addTodoDialog(BuildContext context) async {
//     final TextEditingController controller = TextEditingController();
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Add ToDo'),
//         content: TextField(
//           controller: controller,
//           decoration: InputDecoration(hintText: 'Enter todo title'),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () async {
//               final title = controller.text;
//               if (title.isNotEmpty) {
//                 await _addTodo(title);
//                 Navigator.of(context).pop();
//               }
//             },
//             child: Text('Add'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _addTodo(String title) async {
//     final firestore = FirebaseFirestore.instance;
//     await firestore.collection('todos').add({
//       'title': title,
//       'isCompleted': false,
//     });
//   }
// }

import 'package:experimental_app/providers/valueProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  String title = '';
                  return AlertDialog(
                    title: Text('Add Todo'),
                    content: TextField(
                      onChanged: (value) {
                        title = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter todo title',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          ref.read(todoProvider.notifier).addTodo(title);
                          Navigator.of(context).pop();
                        },
                        child: Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration:
                    todo.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) {
                ref.read(todoProvider.notifier).toggleTodoCompletion(todo.id);
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ref.read(todoProvider.notifier).deleteTodo(todo.id);
              },
            ),
            onTap: () {
              ref.read(navigationProvider.notifier).goToPage(1);
            },
          );
        },
      ),
    );
  }
}
