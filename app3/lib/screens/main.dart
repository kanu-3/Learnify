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
            Container(
              height: 350,
              decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/mainlogo.png"),fit: BoxFit.contain)
        ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Color(0xFF9B84F6), 
            ),
          ],
        ),
      ),
    );
  }
}

// class LogoWidget extends StatelessWidget {
//   const LogoWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             Container(
//               height: 100,
//               width: 40,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black,
//                   width: 2,
//                 ),
//                 color: Color(0xFF9B84F6),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//             ),
            
//           ],
//         ),
//         const SizedBox(height: 8),
//         RichText(
//           textAlign: TextAlign.center,
//           text: const TextSpan(
//             style: TextStyle(fontSize: 20),
//             children: [
//               TextSpan(
//                 text: 'LEARN',
//                 style: TextStyle(
//                   color: Color(0xFF9B84F6),
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               TextSpan(
//                 text: 'IFY',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 4),
//         const Text(
//           'The Only Solution',
//           style: TextStyle(fontStyle: FontStyle.italic),
//         ),
//       ],
//     );
//   }
// }


