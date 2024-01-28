import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_template/core/values/app_colors.dart';
import 'package:flutter_firebase_auth_template/core/widgets/app_layout.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_button.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_text.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_state.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/forgot_password/forgot_password_page.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/login/widgets/login_form.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/register/register_page.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 24, left: 24),
                child: ReuseableText(
                  "Login",
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              LoginForm(
                formKey: _formKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => ForgotPasswordPage()));
                  },
                  child: ReuseableText("Forgot password?"),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ReuseableButton(
                    text: "Login",
                    onTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      context.read<AuthBloc>().add(LoginEvent(context,
                          email: emailController.text,
                          password: passwordController.text));
                    },
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ReuseableButton(
                text: "Register",
                backgroundColor: AppColors.background,
                textColor: AppColors.black,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => RegisterPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
