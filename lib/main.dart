import 'package:flutter/material.dart';
import 'package:tokoto_shop/routs.dart';
import 'package:tokoto_shop/screens/splash/splash_screen.dart';
import 'package:tokoto_shop/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
