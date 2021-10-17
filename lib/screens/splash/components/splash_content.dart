import 'package:flutter/material.dart';
import 'package:tokoto_shop/size_config.dart';
import 'package:tokoto_shop/constants.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Column(
            children: [
              const Spacer(),
              Text(
                'TOKOTO',
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(36),
                  //fontSize: getProportionateOverallSize(width: 36, height: 72),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 2),
              Image.asset(
                image,
                fit: BoxFit.scaleDown,
                height: getProportionateScreenHeight(265),
                width: getProportionateScreenWidth(235),
              ),
            ],
          ),
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
