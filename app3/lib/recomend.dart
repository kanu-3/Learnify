import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CourseRecommendation {
  final String courseTitle;
  final String url;
  final double price;
  final int matchScore;

  CourseRecommendation({
    required this.courseTitle,
    required this.url,
    required this.price,
    required this.matchScore,
  });

  factory CourseRecommendation.fromJson(Map<String, dynamic> json) {
    return CourseRecommendation(
      courseTitle: json['course_title'],
      url: json['url'],
      price: json['price'].toDouble(),
      matchScore: json['match_score'],
    );
  }
}

Future<List<CourseRecommendation>> fetchRecommendations(Map<String, String> profileDetails) async {
  final Uri url = Uri.parse('https://lms-recommend.onrender.com/recommend/'); 

  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      "profile_details": profileDetails,
    }),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> recommendationsData = data['recommendations'];

    return recommendationsData
        .map((course) => CourseRecommendation.fromJson(course))
        .toList();
  } else {
    throw Exception('Failed to load recommendations');
  }
}

class Recomend extends StatefulWidget {
  const Recomend({Key? key}) : super(key: key);

  @override
  _RecomendState createState() => _RecomendState();
}

class _RecomendState extends State<Recomend> {
  final _formKey = GlobalKey<FormState>(); 
  final _interestController = TextEditingController();
  final _goalController = TextEditingController();
  final _experienceController = TextEditingController();
  final _skillsController = TextEditingController();

  bool _isLoading = false;
  List<CourseRecommendation> _courses = [];

  String? _validateField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  Future<void> _getRecommendations() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      Map<String, String> profileDetails = {
        "interest": _interestController.text,
        "goal": _goalController.text,
        "experience": _experienceController.text,
        "skills": _skillsController.text,
      };

      try {
        List<CourseRecommendation> recommendations =
            await fetchRecommendations(profileDetails);
        setState(() {
          _courses = recommendations;
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to fetch recommendations: $e'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Course Recommendations"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,  
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _interestController,
                  decoration: const InputDecoration(
                    labelText: 'Interest',
                    hintText: 'Enter your area of interest (e.g., Data Science)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) => _validateField(value, 'Interest'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _goalController,
                  decoration: const InputDecoration(
                    labelText: 'Goal',
                    hintText: 'Enter your goal (e.g., Become a data scientist)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) => _validateField(value, 'Goal'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _experienceController,
                  decoration: const InputDecoration(
                    labelText: 'Experience',
                    hintText: 'Enter your experience level (e.g., Beginner)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) => _validateField(value, 'Experience'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _skillsController,
                  decoration: const InputDecoration(
                    labelText: 'Skills',
                    hintText: 'Enter your skills (e.g., Python, Machine Learning)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  validator: (value) => _validateField(value, 'Skills'),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _getRecommendations,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Get Recommendations'),
              ),
              const SizedBox(height: 16),
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: _courses.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_courses[index].courseTitle),
                            subtitle: Text('Price: \$${_courses[index].price}'),
                            trailing:
                                Text('Match Score: ${_courses[index].matchScore}'),
                            onTap: () {},
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
