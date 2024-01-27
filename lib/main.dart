import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/home/home_page.dart';
import 'package:flutter_firebase_auth_template/init.dart';

Future<void> main() async {
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      builder: EasyLoading.init(),
    );
  }
}
