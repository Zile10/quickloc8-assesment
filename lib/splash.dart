import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double splashImgWidth = 250;
  int increment = 1;

  @override
  void initState() {
    super.initState();
    _splasherUp();
    _navigateHome();
  }

  void _splasherUp() {
    Future.delayed(
      const Duration(milliseconds: 20),
      () => {
        if (splashImgWidth <= 300)
          {
            setState(() {
              splashImgWidth += increment;
            }),
            _splasherUp()
          }
        else if (splashImgWidth > 300)
          {
            setState(() {
              splashImgWidth -= increment;
            }),
            _splasherDown()
          }
      },
    );
  }

  void _splasherDown() {
    Future.delayed(
      const Duration(milliseconds: 20),
      () => {
        if (splashImgWidth >= 250)
          {
            setState(() {
              splashImgWidth -= increment;
            }),
            _splasherDown()
          }
        else if (splashImgWidth <= 250)
          {
            setState(() {
              splashImgWidth += increment;
            }),
            _splasherUp()
          }
      },
    );
  }

  void _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 3500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/Quicloc8-logo.png',
          width: splashImgWidth,
        ),
      ),
    );
  }
}
