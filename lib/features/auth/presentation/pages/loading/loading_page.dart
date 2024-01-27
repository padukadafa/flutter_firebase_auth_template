// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_template/core/values/app_colors.dart';
import 'package:flutter_firebase_auth_template/core/widgets/app_layout.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/home/home_page.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/login/login_page.dart';
import 'package:flutter_firebase_auth_template/injection_container.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 300));
      final user = sl<FirebaseAuth>().currentUser;
      if (user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => LoginPage()),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const AppLayout(
      brightness: Brightness.light,
      statusBarColor: AppColors.background,
      navbarColor: AppColors.background,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: SpinKitDoubleBounce(
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
