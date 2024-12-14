
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Course {
  final String title;
  final String description;
  final int price;
  final double rating;
  final int duration;
  final String subject;
  final String level;
  final String url;

  Course({
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.duration,
    required this.subject,
    required this.level,
    required this.url,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      title: json['course_title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      price: json['price'] is int
          ? json['price']
          : (json['price'] is double ? json['price'].toInt() : 0),
      rating: json['rating'] is double
          ? json['rating']
          : (json['rating'] is int ? json['rating'].toDouble() : 0.0),
      duration: json['content_duration'] is int
          ? json['content_duration']
          : (json['content_duration'] is double
              ? json['content_duration'].toInt()
              : 0),
      subject: json['subject'] ?? 'General',
      level: json['level']?? 'Advanced',
      url: json['url']?? 'Null',
    );
  }
}

class Courselist extends StatefulWidget {
  const Courselist({super.key});

  @override
  State<Courselist> createState() => _CourselistState();
}

class _CourselistState extends State<Courselist> {
  List<Course> courses = [];
  bool isLoading = true;
  bool isError = false;
  int limit = 10;
  String query = ""; 

  @override
  void initState() {
    super.initState();
    fetchCourses(limit: limit);
  }

  Future<void> fetchCourses({int limit = 10}) async {
    try {
      setState(() {
        isLoading = true;
        isError = false;
      });

      final response = await http
          .get(Uri.parse('https://lms-j25h.onrender.com/api/courses?limit=$limit'))
          .timeout(Duration(seconds: 30));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          setState(() {
            courses = data.map((course) => Course.fromJson(course)).toList();
          });
        } else {
          setState(() {
            isError = true;
          });
        }
      } else {
        setState(() {
          isError = true;
        });
      }
    } catch (e) {
      setState(() {
        isError = true;
      });
      print('Error fetching courses: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All Courses",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value; 
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search for courses...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          
          if (isLoading) 
            Center(child: CircularProgressIndicator())
          else if (isError)
            Center(child: Text('Failed to load courses, please try again'))
          else 
            Expanded(
              child: ListView.builder(
                itemCount: courses
                    .where((course) =>
                        course.title.toLowerCase().contains(query.toLowerCase()) ||
                        course.subject.toLowerCase().contains(query.toLowerCase()))
                    .toList()
                    .length,
                itemBuilder: (context, index) {
                  final course = courses
                      .where((course) =>
                          course.title.toLowerCase().contains(query.toLowerCase()) ||
                          course.subject.toLowerCase().contains(query.toLowerCase()))
                      .toList()[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: const Color.fromARGB(255, 158, 247, 213),
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetails(course: course),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(Icons.book, size: 40),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      course.title,
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      course.description,
                                      style: TextStyle(fontSize: 14, color: Colors.grey),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.yellow, size: 16),
                                        Text('${course.rating}'),
                                        SizedBox(width: 10),
                                        Icon(Icons.access_time, size: 16),
                                        Text('${course.duration} hrs'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class CourseDetails extends StatelessWidget {
  final Course course;

  const CourseDetails({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: const Color.fromARGB(255, 136, 90, 215),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/Saly-10.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
        
              
              Text(
                'Course Title: ${course.title}',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Price: \$${course.price}', style: TextStyle(fontSize: 18)),
              Text('Rating: ${course.rating}', style: TextStyle(fontSize: 18)),
              Text('Subject: ${course.subject}', style: TextStyle(fontSize: 18)),
              Text('Duration: ${course.duration} hours', style: TextStyle(fontSize: 18)),
              Text('Level: ${course.level} hours', style: TextStyle(fontSize: 18)),
              Text('Description: ${course.description} hours', style: TextStyle(fontSize: 18)),
              Text('Find more info on: ${course.url} hours', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseSearchDelegate extends SearchDelegate<Course> {
  final List<Course> courses;

  CourseSearchDelegate(this.courses);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = courses.where((course) =>
        course.title.toLowerCase().contains(query.toLowerCase()) ||
        course.subject.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final course = results[index];
        return ListTile(
          title: Text(course.title),
          subtitle: Text(course.description),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetails(course: course),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = courses.where((course) =>
        course.title.toLowerCase().contains(query.toLowerCase()) ||
        course.subject.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final course = suggestions[index];
        return ListTile(
          title: Text(course.title),
          onTap: () {
            query = course.title;
            showResults(context);
          },
        );
      },
    );
  }
}
