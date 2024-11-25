import 'package:flutter/material.dart';
import 'package:app3/screens/Sign%20Up.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrontPage(),
    );
  }
}

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Lea',
                    style: TextStyle(
                      fontSize: 40, 
                      fontWeight: FontWeight.bold, 
                      fontFamily: 'Cursive',
                      color: Colors.deepPurple, 
                    ),
                  ),
                   TextSpan(
                    text: 'rnify',
                    style: TextStyle(
                      fontSize: 40, 
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Cursive',
                      color: Colors.black, 
                    ),
                  ),
                ],
              ),
              ),
          SizedBox(height: 10,),

                Image.asset("assets/images/cuate.png",height: 150,),
            const SizedBox(height: 30), 

            
            Container(
              width: 250, 
              height: 250, 
              decoration: BoxDecoration(
                color: Colors.deepPurple[100], 
                borderRadius: BorderRadius.circular(20), 
              ),
              child: const Icon(
                Icons.school, 
                size: 120,
                color: Colors.deepPurple, 
              ),
            ),
            const SizedBox(height: 30), 

            
            const Text(
              'Let’s Start!',
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.bold, 
                color: Colors.black, 
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), 

            
            SizedBox(
              width: 150, 
              height: 45, 
              child: ElevatedButton(
                onPressed: () {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpApp(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), 
                  ),
                ),
                child: const Text(
                  'NEXT',
                  style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white, 
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up Page',
              style: TextStyle(
                fontSize: 40, 
                fontWeight: FontWeight.bold, 
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: 20), 

            Text(
              'This is the Sign Up page where users can create an account.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18, 
                color: Colors.black54, 
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
