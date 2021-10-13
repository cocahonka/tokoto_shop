import 'package:flutter/material.dart';

// This is the best practice
import '../components/splash_content.dart';

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
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index].text,
                  image: splashData[index].image,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
