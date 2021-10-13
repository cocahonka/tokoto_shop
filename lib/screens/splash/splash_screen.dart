import 'package:flutter/material.dart';
import 'package:tokoto_shop/screens/splash/components/body.dart';
import 'package:tokoto_shop/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/spllash';

  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
