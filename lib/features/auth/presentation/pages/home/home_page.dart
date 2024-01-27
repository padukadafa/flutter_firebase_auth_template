import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_auth_template/core/widgets/app_layout.dart';
import 'package:flutter_firebase_auth_template/core/widgets/reuseable_button.dart';
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
              return ReuseableButton(
                text: "Logout",
                onTap: () {
                  context.read<AuthBloc>().add(LogoutEvent(context));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
