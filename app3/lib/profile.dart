import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 133, 85, 217),
        elevation: 10,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(child: Text("Error occurred while fetching profile data", style: TextStyle(color: Colors.red, fontSize: 18)))
              : profileData == null
                  ? Center(child: Text("No profile data available", style: TextStyle(fontSize: 18)))
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 75,
                              backgroundImage: AssetImage("assets/images/profilepic.png"),
                            ),
                          ),
                          SizedBox(height: 20),

                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.person, color: Colors.deepPurple),
                              title: Text("Name: ${profileData['fullName']}", style: TextStyle(fontSize: 20)),
                            ),
                          ),
                          SizedBox(height: 10),

                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.email, color: Colors.deepPurple),
                              title: Text("Email: ${profileData['email']}", style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          SizedBox(height: 10),

                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.account_circle, color: Colors.deepPurple),
                              title: Text("Username: ${profileData['username']}", style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          SizedBox(height: 10),

                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.cake, color: Colors.deepPurple),
                              title: Text("Date of Birth: ${profileData['dateOfBirth']}", style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              leading: Icon(Icons.email, color: Colors.deepPurple),
                              title: Text("About: ${profileData['description']}", style: TextStyle(fontSize: 18)),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
    );
  }
}
