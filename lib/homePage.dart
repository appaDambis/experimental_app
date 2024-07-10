// import 'package:experimental_app/providers/valueProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CounterPage extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final counter = ref.watch(counterProvider);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter App with Riverpod'),
//       ),
//       body: Center(
//         child: Text(
//           '$counter',
//           style: TextStyle(fontSize: 48),
//         ),
//       ),
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).increment();
//             },
//             child: Icon(Icons.add),
//             tooltip: 'Increment',
//           ),
//           SizedBox(height: 16),
//           FloatingActionButton(
//             onPressed: () {
//               ref.read(counterProvider.notifier).decrement();
//             },
//             child: Icon(Icons.remove),
//             tooltip: 'Decrement',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:experimental_app/providers/valueProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Homepage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(valueProvider);
    return Scaffold(
      body: Center(
        child: Text("$value"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(valueProvider.notifier).add();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 40,
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(valueProvider.notifier).minus();
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              ref.read(nextPageProvider.notifier).nextPage(1);
            },
            child: Icon(Icons.skip_next),
          )
        ],
      ),
    );
  }
}
