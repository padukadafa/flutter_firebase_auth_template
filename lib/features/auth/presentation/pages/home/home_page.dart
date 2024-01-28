import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_template/core/widgets/app_layout.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_avatar.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_button.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_text.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_event.dart';
import 'package:flutter_firebase_auth_template/features/auth/presentation/blocs/auth/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReuseableAvatar(
                    avatarUrl: state.user?.avatar ?? "",
                    diameter: 150,
                  ),
                  ReuseableText(state.user?.uid ?? "Loading..."),
                  const SizedBox(
                    height: 24,
                  ),
                  ReuseableText(
                    state.user?.name ?? "Loading...",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  ReuseableText(
                    state.user?.email ?? "Loading...",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ReuseableButton(
                    text: "Logout",
                    onTap: () {
                      context.read<AuthBloc>().add(LogoutEvent(context));
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
