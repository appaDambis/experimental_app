import 'package:experimental_app/providers/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(itemProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Item List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                ref.read(itemProvider.notifier).removeItem(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('Item ${items.length + 1}');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
