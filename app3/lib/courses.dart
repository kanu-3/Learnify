import 'package:app3/mainpage.dart';
import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCoursesScreen(),
    );
  }
}

class MyCoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("My courses", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Mainpage()));
              }, icon: Icon(Icons.arrow_back)),
                ],
              ),
            
              SizedBox(height: 16),
        
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100, 
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Graphic Design', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade800)),
                    SizedBox(height: 8),
                    Text('Graphic Design Advanced', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue.shade700)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Progress: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('30%'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text('Lectures: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('27/90 lectures completed'),
                      ],
                    ),
                  ],
                ),
              ),
        
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.green.shade100, 
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Development', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green.shade800)),
                    SizedBox(height: 8),
                    Text('Basics of Web Development', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green.shade700)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Progress: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('50%'),
                      ],
                      
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text('Lectures: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('25/50 lectures completed'),
                      ],
                    ),
                  ],
                ),
              ),
        
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100, 
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Graphic Design', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange.shade800)),
                    SizedBox(height: 8),
                    Text('Graphic Design Advanced', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange.shade700)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Progress: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('42%'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text('Lectures: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('11/24 lectures completed'),
                      ],
                    ),
                  ],
                ),
              ),
        
              Container(
                padding: const EdgeInsets.all(12.0),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100, 
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Graphic Design', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.purple.shade800)),
                    SizedBox(height: 8),
                    Text('Graphic Design Advanced', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple.shade700)),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text('Progress: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('100%'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text('Lectures: ', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('42/42 lectures completed'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


