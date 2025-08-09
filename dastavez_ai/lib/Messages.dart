import 'package:dastavez_ai/Home.dart';
import 'package:dastavez_ai/Profile.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Messages extends StatefulWidget{
  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {

  Future<String?> sendMessage(String userMessage) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('authToken');

    final url = Uri.parse("http://34.68.115.157:5000/api/chat/message");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({"message": userMessage}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['response'];
    } else {
      print("Chat API error: ${response.body}");
      return null;
    }
  }




  final TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  void _send() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({"role": "user", "text": userMessage});
      _controller.clear();
    });

    final aiReply = await sendMessage(userMessage);

    if (aiReply != null) {
      setState(() {
        _messages.add({"role": "ai", "text": aiReply});
      });
    }
  }

  var currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ListTile(
                  title: Align(
                    alignment: msg['role'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: msg['role'] == 'user' ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(msg['text'] ?? ""),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: "Ask something..."),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _send,
                ),
              ],
            ),
          )
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

    if(index == 2){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context){
    return Profile();
    })
    );
    }
    else if(index == 0){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context){
    return HomePage();
    })
    );
    }
    },
    )
    );
  }
}