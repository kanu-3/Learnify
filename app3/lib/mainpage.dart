import 'package:app3/assistant.dart';
import 'package:app3/courselist.dart';
import 'package:app3/courses.dart';
import 'package:app3/livecourse.dart';
import 'package:app3/profile.dart';
import 'package:app3/recomend.dart';
import 'package:app3/viewallcourse.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mainpage(),
    );
  }
}

class Mainpage extends StatefulWidget {
  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  bool isLoading = true;
  bool hasError = false;
  var profileData;

  @override
  void initState() {
    super.initState();
    fetchProfileDetails();
  }

  Future<void> fetchProfileDetails() async {
    String? token = await getAuthToken();

    if (token == null) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
      print("Token is not available");
      return;
    }

    String url = "https://lms-j25h.onrender.com/api/auth/profile";
    
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          profileData = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
        print("Failed to retrieve data. Status code: ${response.statusCode}");
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
      print("Error fetching details: $e");
    }
  }

  Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  int _currentIndex = 0;
  final List<Widget> screens = [
    MainpageContent(), 
    Viewallcourse(),
    ChatScreen(),
    Courselist(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentIndex],  
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;  
          });
        },
        backgroundColor: Colors.blue,  
        selectedItemColor: const Color.fromARGB(255, 18, 218, 28),  
        unselectedItemColor: Colors.grey,  
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'My Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Assistant'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
        ],
      ),
    );
  }
}

class MainpageContent extends StatelessWidget {
  final List<String> text = [
    "What's new",
    'Learn More',
    'Enroll Now',
  ];
  final List<Color> colors = [
    const Color.fromARGB(255, 195, 126, 181),
    const Color.fromARGB(255, 33, 218, 206),
    const Color.fromARGB(255, 82, 127, 159),
  ];
  final List<String> images = [
    "assets/images/pana.png",
    "assets/images/cuate.png",
    "assets/images/cuate1.png",
  ];

  @override
  Widget build(BuildContext context) {
    
    var profileData = (context.findAncestorStateOfType<_MainpageState>()?.profileData);

    
    String fullName = profileData != null ? profileData['fullName'] ?? 'User' : 'User';

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                        height: 55,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                          },
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(profileData != null ? profileData['userPhoto'] ?? '' : ''),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Hello $fullName",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Recomend()));
                        }, icon: Icon(Icons.more))
                      ],
                                        ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Find your course",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.search),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for courses...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: List.generate(
                colors.length,
                (index) => _buildCarouselItem(images[index], text[index], colors[index]),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30, 
                        backgroundColor: const Color.fromARGB(255, 207, 126, 231),
                        child: Icon(
                          Icons.web, 
                          size: 30, 
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8), 
                      Text('Web', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor:const Color.fromARGB(255, 207, 126, 231),
                        child: Icon(
                          Icons.apps, 
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('App', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromARGB(255, 207, 126, 231),
                        child: Icon(
                          Icons.design_services, 
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('UI/UX', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color.fromARGB(255, 207, 126, 231),
                        child: Icon(
                          Icons.computer, 
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('ML', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All courses',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Courses()));
                    },
                    child: Text("Recorded Courses"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Livecourse()));
                      },
                      child: Text("Live Courses"),
                    ),
                  ),
                   
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.play_circle, color: Colors.red),
                      SizedBox(width: 10),
                      Text(
                        'UI/UX Designer',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text('Google', style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 10),
                  Text(
                    'Basics of Figma',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2 hours', style: TextStyle(color: Colors.grey)),
                      Text('\$ 29.99', style: TextStyle(color: Colors.green)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselItem(String image, String text, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 200, width: 420),
          SizedBox(height: 10),
          Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
