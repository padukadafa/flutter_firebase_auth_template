import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/loading/loading_page.dart';
import 'package:flutter_firebase_auth_template/init.dart';
import 'package:flutter_firebase_auth_template/injection_container.dart';

Future<void> main() async {
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: MaterialApp(
        home: const LoadingPage(),
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      ),
    );
  }
}
