import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http_parser/http_parser.dart';
import 'package:dastavez_ai/Home.dart';
import 'package:dastavez_ai/Messages.dart';
import 'package:dastavez_ai/UpdateProfile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget{


  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  File? _imageFile;

  // Future<bool> uploadProfileImage(File imageFile) async{
  //   SharedPreferences prefs=await SharedPreferences.getInstance();
  //   String? token = prefs.getString("authToken");
  //  
  //   if(token == null){
  //     print("No auth token found");
  //     return false;
  //   }
  //  
  //   try {
  //     var request = http.MultipartRequest('POST',
  //     Uri.parse("http://34.68.115.157:5000/api/profile/profile-image"),
  //     );
  //
  //     request.headers['Authorization']='Bearer $token';
  //
  //     request.files.add(
  //       await http.MultipartFile.fromPath('profileImage', imageFile.path),
  //     );
  //
  //     var response = await request.send();
  //
  //     if(response.statusCode == 200){
  //       print("Profile Image uploaded successfully");
  //       return true;
  //     }
  //     else{
  //       String body = await response.stream.bytesToString();
  //       print("Upload failed: ${response.statusCode} - $body");
  //       return false;
  //     }
  //   }
  //   catch(e){
  //     print("Error uploading image: $e");
  //     return false;
  //   }
  // }

  String _getFileExtension(String path){
    return path.split('.').last.toLowerCase();
  }
  Future<bool> uploadProfileImage(String originalPath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("authToken");

    if (token == null) return false;

    // Prepare the value exactly as your curl: @"C:\Users\Ahana saraff\Desktop\girl.jpg"
      // remember double backslash to escape \

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://34.68.115.157:5000/api/profile/profile-image'),
    );

    request.headers['Authorization'] = 'Bearer $token';

    // Add the profileImage field as a text field with the path string
    request.files.add(
      await http.MultipartFile.fromPath('profileImage', originalPath,
      contentType: MediaType('image', _getFileExtension(originalPath))),
    );

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        print('Path sent successfully as multipart field');
        return true;
      } else {
        String respStr = await response.stream.bytesToString();
        print('Failed: ${response.statusCode} - $respStr');
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  @override
  void initState(){
    super.initState();
    loadUserProfile();
  }

  int currentPageIndex = 2;

  String? firstName;
  String? lastName;
  String? email;
  String? profileImage;
  String? subscriptionStatus;
  String? tokenn;



  bool isLoading = true;

  Future<void> loadUserProfile() async{
    try{
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken');

      if(token == null){
        print('No token found!');
        return;
      }

      //Call Api
      final response = await http.get(
        Uri.parse('http://34.68.115.157:5000/auth/user'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if(response.statusCode == 200){
        final data = json.decode(response.body);

        setState(() {
          firstName = data['firstName'];
          lastName = data['lastName'];
          email = data['email'];
          profileImage = data['profileImage'];
          subscriptionStatus = data['subscriptionStatus'];
          isLoading = false;
          tokenn = token;
        });
      }
      else{
        print('Failed to load profile: ${response.statusCode}');
      }
    }catch(e){
      print('Error: $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
        SizedBox(height: 10,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("AI-Powered ", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
              Text("Legal Intelligence ", style: TextStyle(color: Color(0xFFDEBE21), fontSize: 25, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(


                decoration: BoxDecoration(
                  color: Color(0xFF1A1F2C),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50))
                ),
                child: Expanded(
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(height: 30,),
                          GestureDetector(
                              onTap: () async {
                                final picker = ImagePicker();
                                final pickedFile = await picker.pickImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 85,
                                );

                                if(pickedFile != null){
                                  setState(() {
                                    _imageFile = File(pickedFile.path);
                                    print(_imageFile?.path);
                                  });
                                }

                                bool success = await uploadProfileImage(_imageFile!.path);
                                if(success){
                                  setState(() {
                                    loadUserProfile();
                                  });
                                }
                                else
                                  {
                                    print("Upload failed!");
                                    print(_imageFile?.path);

                                  }

                              },
                            child: CircleAvatar(
                              radius: 60,
                              backgroundImage: profileImage != null
                                  ? NetworkImage(profileImage!)
                                  : AssetImage('assets/images/profile.jpg') as ImageProvider,
                            ),
                          ),
                          SizedBox(height: 16,),
                          Text("$firstName $lastName", style: TextStyle(color: Colors.white, fontSize: 25,),),
                          Text(email ?? '', style: TextStyle(color: Colors.white, fontSize: 15,),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(subscriptionStatus=='premium'?'Premium':'Free User', style: TextStyle(color: subscriptionStatus == 'premium'?Color(0xFFDEBE21):Colors.grey,fontSize: 16),)
                              // Icon(Icons.star, color: Color(0xFFDEBE21),),
                              // Text("Premium", style: TextStyle(color: Color(0xFFDEBE21), fontSize: 18,)),
                              
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 15,),
                                    Container(
                                      width: 400,
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF203354),
                                                border: Border.all(color: Color(0xFFDEBE21)),
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFF2E3443),
                                                      spreadRadius: 2,
                                                  )
                                                ]
                                              ),
                                              child: InkWell(
                                                  onTap: () async {
                                                    final updated = await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => UpdateProfileScreen(),
                                                      ),
                                                    );

                                                    if (updated == true) {
                                                      loadUserProfile(); // refresh only if update happened
                                                    }
                                                  },
                                                  child: Text("Edit Profile", style: TextStyle(fontSize: 15),))),
                                          SizedBox(height: 10,),
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF203354),
                                                border: Border.all(color: Color(0xFFDEBE21)),
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0xFF2E3443),
                                                    spreadRadius: 2,
                                                  )
                                                ]
                                              ),
                                              child: Text("Account Settings", style: TextStyle(fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF203354),
                                                  border: Border.all(color: Color(0xFFDEBE21)),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color(0xFF2E3443),
                                                        spreadRadius: 2,
                                                    )
                                                  ]
                                              ),
                                              child: Text("Usage Information", style: TextStyle(fontSize: 15),)),
                                          SizedBox(height: 10,),
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF203354),
                                                  border: Border.all(color: Color(0xFFDEBE21)),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color(0xFF2E3443),
                                                        spreadRadius: 2,
                                                    )
                                                  ]
                                              ),
                                              child: Text("Upgrade", style: TextStyle(fontSize: 15),)),

                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                              width: double.infinity,
                                              height: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF203354),
                                                  border: Border.all(color: Color(0xFFDEBE21)),
                                                  borderRadius: BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Color(0xFF2E3443),
                                                      spreadRadius: 2,
                                                    )
                                                  ]
                                              ),
                                              child: Text("Logout", style: TextStyle(fontSize: 15),)),
                                          SizedBox(
                                            height: 20,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon:Icon(Icons.messenger_sharp), label:"Messages"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
      ],
        animationDuration: Duration(microseconds: 1000),
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index){
          setState((){
            currentPageIndex = index;
          },);
          if(index == 0){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context){
                return HomePage();
              })
            );
          }
          else if(index==1){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Messages();
            }));
          }
        },
      ),
    );
  }
}