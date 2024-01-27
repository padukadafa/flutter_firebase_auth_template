import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth_template/core/validators/validator.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_text_form.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          ReuseableTextForm(
            hintText: "John",
            title: "Name",
            controller: nameController,
            validator: Validator.min,
          ),
          ReuseableTextForm(
            hintText: "example@mail.com",
            textInputType: TextInputType.emailAddress,
            title: "Email",
            controller: emailController,
            validator: Validator.emailValidator,
          ),
          const SizedBox(
            height: 12,
          ),
          ReuseableTextForm(
            hintText: "******",
            showHideButton: true,
            title: "Password",
            controller: passwordController,
            validator: Validator.min,
          ),
        ],
      ),
    );
  }
}
