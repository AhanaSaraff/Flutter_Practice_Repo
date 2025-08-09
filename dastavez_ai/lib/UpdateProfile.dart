import 'dart:convert';
import 'package:dastavez_ai/Profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileScreen extends StatefulWidget {

  final VoidCallback? onProfileUpdated;

  const UpdateProfileScreen({Key? key, this.onProfileUpdated}) : super (key: key);

  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool isLoading = false;

  Future<void> _updateProfile() async {
    if(widget.onProfileUpdated != null){
      widget.onProfileUpdated!();


    }
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');

    if (token == null) {
      print('No token found');
      return;
    }

    final url = Uri.parse("http://34.68.115.157:5000/api/profile/update");

    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode({
        "firstName": _firstNameController.text,
        "lastName": _lastNameController.text
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("${data['message']}")),
      );
      Navigator.pop(context, true);
    } else {
      print("Error: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update profile")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
        backgroundColor: const Color(0xFF1A1F2C),
      ),
      body: Container(
        color: const Color(0xFF1A1F2C),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _firstNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "First Name",
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: const Color(0xFF203354),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _lastNameController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Last Name",
                hintStyle: TextStyle(color: Colors.grey[400]),
                filled: true,
                fillColor: const Color(0xFF203354),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed:isLoading ? null : _updateProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDEBE21),
              ),
              child: isLoading
                  ? const CircularProgressIndicator(color: Colors.black)
                  : const Text(
                "Update",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
