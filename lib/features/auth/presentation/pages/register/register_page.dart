import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_template/core/values/app_colors.dart';
import 'package:flutter_firebase_auth_template/core/widgets/app_layout.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_button.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_text.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_state.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/login/login_page.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/pages/register/widgets/register_form.dart';

class RegisterPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  RegisterPage({super.key});
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
                  "Register",
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              RegisterForm(
                formKey: _formKey,
                emailController: emailController,
                passwordController: passwordController,
                nameController: nameController,
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ReuseableButton(
                    text: "Register",
                    onTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      context.read<AuthBloc>().add(
                            RegisterEvent(
                              context,
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ReuseableButton(
                text: "Login",
                backgroundColor: AppColors.background,
                textColor: AppColors.black,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => LoginPage(),
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
