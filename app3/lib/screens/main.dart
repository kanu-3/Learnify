import 'package:flutter/material.dart';
import 'dart:async';

import 'package:app3/screens/starting%20page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static const int _splashDuration = 3; 

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: _splashDuration), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => FrontPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: AppColors.purple, 
            ),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100,
              width: 40,
              decoration: BoxDecoration(
                color: AppColors.purple,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              height: 100,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: AppTextStyles.logoTextStyle,
            children: [
              TextSpan(
                text: 'LEARN',
                style: TextStyle(
                  color: AppColors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: 'IFY',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'The Only Solution',
          style: AppTextStyles.taglineStyle,
        ),
      ],
    );
  }
}

class AppColors {
  static const Color purple = Color(0xFF9B84F6);
}

class AppTextStyles {
  static const TextStyle logoTextStyle = TextStyle(fontSize: 20);
  static const TextStyle taglineStyle = TextStyle(
    color: AppColors.purple,
    fontStyle: FontStyle.italic,
  );
}

