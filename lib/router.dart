import 'package:flutter/material.dart';
import 'package:opticash/presentation/auth/auth_base.dart';
import 'package:opticash/presentation/auth/login_screen.dart';
import 'package:opticash/presentation/auth/registration_screen.dart';
import 'package:opticash/presentation/home/bottom_widget.dart';
import 'package:opticash/presentation/splash_screen/splash_screen.dart';
import 'package:opticash/router_name.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case RouterName.splashName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    case RouterName.basedHome:
      return MaterialPageRoute(builder: (_) => const AuthBase());

    case RouterName.signInName:
      return MaterialPageRoute(builder: (_) => const LoginScreen());

    case RouterName.signUpName:
      return MaterialPageRoute(builder: (_) => const RegistrationScreen());

    case RouterName.homeName:
      return MaterialPageRoute(builder: (_) => const RootBottom());

    case '/':
      return MaterialPageRoute(builder: (_) => const SplashScreen());

    default:
      return errorRoute();
  }
}

MaterialPageRoute errorRoute() {
  return MaterialPageRoute(
    builder: ((context) => const Scaffold(
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Route does not exist or route has not been registered.',
              ),
            ),
          ),
        )),
  );
}
