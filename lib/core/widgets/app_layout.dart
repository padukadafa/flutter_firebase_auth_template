import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase_auth_template/core/values/app_colors.dart';

class AppLayout extends StatelessWidget {
  final Color statusBarColor;
  final Brightness brightness;
  final Color navbarColor;
  final Widget child;
  const AppLayout({
    super.key,
    this.brightness = Brightness.dark,
    this.navbarColor = AppColors.background,
    this.statusBarColor = AppColors.background,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor: navbarColor,
        statusBarBrightness: brightness,
        statusBarIconBrightness: brightness,
      ),
      child: SafeArea(child: child),
    );
  }
}
