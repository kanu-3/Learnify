import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CongratulationsPage(),
    );
  }
}

class CongratulationsPage extends StatelessWidget {
  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SingleChildScrollView( 
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple, 
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Icon(
                      Icons.person, 
                      size: 80, 
                      color: Colors.white, 
                    ),
                    Positioned(
                      bottom: 30, 
                      child: CustomPaint(
                        size: const Size(100, 50), 
                        painter: ArcPainter(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30), 

                const Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontSize: 36, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.deepPurple, 
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10), 

                const Text(
                  'Your account is ready to use.\nYou will be redirected to the Home page in a few seconds.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54, 
                  ),
                ),
                const SizedBox(height: 30), 

                // Next Button
                ElevatedButton(
                  onPressed: () {
                    
                    print("Next button pressed");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), 
                    ),
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 18, 
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.deepPurple 
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final Rect arcRect = Rect.fromLTWH(
      size.width * 0.1, 
      size.height * 0.5, 
      size.width * 0.8, 
      size.height * 0.5, 
    );
    canvas.drawArc(arcRect, 3.14, 3.14, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}