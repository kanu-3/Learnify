import 'package:app3/screens/loginmain.dart';
import 'package:flutter/material.dart';

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
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cuate.png"),
                fit: BoxFit.contain
              ),
            ),
          ),
          Positioned(
            top: 7,left: 2,
            child: Container(
              height: 150,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/mainlogo.png"),fit: BoxFit.contain)
              ),
          )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
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
                      Text(
                        "The only solution!",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      )
                    ],
                  ),
                ),
                
                
                Spacer(),
          
               
                Column(
                  children: [
                    const Text(
                      'Let’s Start!',
                      style: TextStyle(
                        fontSize: 32, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.black, 
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 150, 
                      height: 45, 
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreenmain(),
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
