import 'package:flutter/material.dart';
import 'package:tokoto_shop/constants.dart';
import 'package:tokoto_shop/screens/sign_in/sign_in_screen.dart';
import 'package:tokoto_shop/size_config.dart';

// This is the best practice
import '../components/splash_content.dart';
import '../../../components/default_button.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class SplashData {
  final String text;
  final String image;

  const SplashData({
    required this.text,
    required this.image,
  });
}

class _BodyState extends State<Body> {
  int _currentPage = 0;
  static const List<SplashData> _splashData = [
    SplashData(
        text: 'Welcome to Tokoto, Let’s shop!',
        image: 'assets/images/splash_1.png'),
    SplashData(
        text:
            'We help people conect with store \naround United State of America',
        image: 'assets/images/splash_2.png'),
    SplashData(
        text: 'We show the easy way to shop. \nJust stay at home with us',
        image: 'assets/images/splash_3.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemCount: _splashData.length,
            itemBuilder: (context, index) => SplashContent(
              text: _splashData[index].text,
              image: _splashData[index].image,
            ),
          ),
          Column(
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _splashData.length,
                          (index) => buildDot(index: index),
                        ),
                      ),
                      const Spacer(flex: 3),
                      DefaultButton(
                        text: 'Continue',
                        press: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
