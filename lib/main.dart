import 'package:experimental_app/firebase_options.dart';
import 'package:experimental_app/firebase_practise/login_page.dart';
import 'package:experimental_app/providers/valueProvider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(navigationProvider);

    return const MaterialApp(
      // home: pageIndex == 0 ? TodoListPage() : TodoDetailPage(pageIndex - 1),
      // home: HttpListPage(),
      home: LoginPage(),
      // home: MyStatefulWidget(),
      // home: TodoListPage(),
      // home: Resetpage(),
    );
  }
}
