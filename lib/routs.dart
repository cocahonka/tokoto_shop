import 'package:flutter/widgets.dart';
import 'package:tokoto_shop/screens/forgot_password/forgot_password_screen.dart';
import 'package:tokoto_shop/screens/login_success/login_success_screen.dart';
import 'package:tokoto_shop/screens/sign_in/sign_in_screen.dart';
import 'package:tokoto_shop/screens/splash/splash_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
};
