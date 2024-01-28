import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_template/core/validators/validator.dart';
import 'package:flutter_firebase_auth_template/core/widgets/app_layout.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_button.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_text.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_text_form.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_state.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return AppLayout(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 24, left: 24),
                child: ReuseableText(
                  "Forgot Password",
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: _formKey,
                child: ReuseableTextForm(
                  hintText: "example@mail.com",
                  title: "Email",
                  controller: emailController,
                  validator: Validator.emailValidator,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ReuseableButton(
                    text: "Send email",
                    onTap: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      context.read<AuthBloc>().add(ForgotPasswordEvent(context,
                          email: emailController.text));
                    },
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
