import 'package:app3/mainpage.dart';
import 'package:app3/videoplayer.dart';
import 'package:flutter/material.dart';

class Livecourse extends StatefulWidget {
  const Livecourse({super.key});

  @override
  State<Livecourse> createState() => _LivecourseState();
}

class _LivecourseState extends State<Livecourse> {
  String videoUrl = 'https://www.youtube.com/watch?v=9xwazD5SyVg&pp=ygURZHVtbXkgc2hvcnQgdmlkZW8%3D';
  String video="https://www.youtube.com/shorts/XYy--OK5-nk";
  String videoo="https://www.youtube.com/shorts/fTYYCmQ7pZI";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Mainpage()));
              }, icon: Icon(Icons.arrow_back)),
              
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
            color: const Color.fromARGB(255, 241, 180, 250),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/2.png"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Flutter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 130),
                    child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Videoplayer(videoUrl: video)));
                    }, icon: Icon(Icons.play_circle, color: Colors.red,size: 50,),),
                  )
                ],
              ),
              Text('Google', style: TextStyle(color: Colors.grey)),
              Divider(color: Colors.blue),
              SizedBox(height: 10),
              Text(
                'Basics of Flutter',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Only \$100', style: TextStyle(color: Colors.blue, fontSize: 18)),
                  Row(
                    children: [
                      Text('30 lessons', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Text('Online', style: TextStyle(color: Colors.green)),
                      SizedBox(width: 10),
                      Text('Recorded', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
             boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
            color: const Color.fromARGB(255, 147, 232, 185),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/1.png"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Wordpress',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 100),
                    child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Videoplayer(videoUrl: videoUrl)));
                    }, icon: Icon(Icons.play_circle, color: Colors.red,size: 50,),),
                  )
                ],
              ),
              Text('Google', style: TextStyle(color: Colors.grey)),
              Divider(color: Colors.blue),
              SizedBox(height: 10),
              Text(
                'Basics of Wordpress',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Only \$300', style: TextStyle(color: Colors.blue, fontSize: 18)),
                  Row(
                    children: [
                      Text('30 lessons', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Text('Online', style: TextStyle(color: Colors.green)),
                      SizedBox(width: 10),
                      Text('Recorded', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
            color: const Color.fromARGB(255, 235, 204, 133),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Frame 33839.png"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'DSA',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 160),
                    child: IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Videoplayer(videoUrl: videoo)));
                    }, icon: Icon(Icons.play_circle, color: Colors.red,size: 50,),),
                  )
                ],
              ),
              Text('Server', style: TextStyle(color: Colors.grey)),
              Divider(color: Colors.blue),
              SizedBox(height: 10),
              Text(
                'Basics of Data Structure and Algorithms',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Only \$400', style: TextStyle(color: Colors.blue, fontSize: 18)),
                  Row(
                    children: [
                      Text('60 lessons', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Text('Online', style: TextStyle(color: Colors.green)),
                      SizedBox(width: 10),
                      Text('Recorded', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
            color: const Color.fromARGB(255, 243, 249, 146),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Frame 338391.png"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'HTML',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 150),
                    child: IconButton(onPressed: (){
                    
                    }, icon: Icon(Icons.play_circle, color: Colors.red,size: 50,),),
                  )
                ],
              ),
              Text('Youtube', style: TextStyle(color: Colors.grey)),
              Divider(color: Colors.blue),
              SizedBox(height: 10),
              Text(
                'Basics of HTML',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Only \$300', style: TextStyle(color: Colors.blue, fontSize: 18)),
                  Row(
                    children: [
                      Text('45 lessons', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Text('Online', style: TextStyle(color: Colors.green)),
                      SizedBox(width: 10),
                      Text('Recorded', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
             boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
            color: const Color.fromARGB(255, 167, 162, 245),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/3.png"),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Machine learning',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20,left: 60),
                    child: IconButton(onPressed: (){
                    
                    }, icon: Icon(Icons.play_circle, color: Colors.red,size: 50,),),
                  )
                ],
              ),
              Text('Google', style: TextStyle(color: Colors.grey)),
              Divider(color: Colors.blue),
              SizedBox(height: 10),
              Text(
                'Basics of Machine learning',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Only \$200', style: TextStyle(color: Colors.blue, fontSize: 18)),
                  Row(
                    children: [
                      Text('30 lessons', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10),
                      Text('Online', style: TextStyle(color: Colors.green)),
                      SizedBox(width: 10),
                      Text('Recorded', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ],
          ),
                ),
        ),
            ],
          ),
        ),
      ),
    );
  }
}