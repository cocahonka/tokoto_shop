import 'package:flutter/material.dart';
import 'package:tokoto_shop/constants.dart';
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

  const SplashData({required this.text, required this.image});
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<SplashData> splashData = const [
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
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      text: splashData[index].text,
                      image: splashData[index].image,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Spacer(flex: 3),
                Expanded(
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
                            splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                        const Spacer(flex: 3),
                        DefaultButton(
                          text: 'Continue',
                          press: () {},
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
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
