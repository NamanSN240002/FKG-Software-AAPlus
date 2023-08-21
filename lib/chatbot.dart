import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:recommender_app/utilities/messages.dart';
import 'package:http/http.dart';

const String urlendpoint = "http://6c97-34-105-73-136.ngrok.io/getMessage";

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            "lib/images_chatbot.png",
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Color(0xff23272C),
            title: Text('Chat Assistant'),
          ),
          body: Container(
            child: Column(
              children: [
                Expanded(child: MessagesScreen(messages: messages)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  color: Colors.black45,
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                        controller: _controller,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                      IconButton(
                        onPressed: () {
                          sendMessage(_controller.text.toString());
                          _controller.clear();
                        },
                        icon: Icon(Icons.send),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('message is empty');
    } else {
      setState(() {
        addMessage(text, true);
      });
      int flg = 0;

      if (text == "List all product names") {
        flg = 1;
        text = messages[messages.length - 2]['message'];
        text = "# " + text;
      }

      Response response = await post(Uri.parse(urlendpoint),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Content-Type': 'multipart/form-data'
          },
          body: jsonEncode(<String, String>{'message': text}));

      if (response.statusCode == 404) return;
      var ret = jsonDecode(response.body);
      if(flg == 1)
      {
         setState(() {
           var temp = ret['data'];
           print(temp);
           for(int i = 0  ; i < temp.length ; i++)
           {
              var res = temp[i];
              var name = res.split('|')[0];
              var url = res.split('|')[1];
              addClickableMessage(name,url);
           }
         });
      }
      else
      {
        setState(() {
          var res = ret['data'][1];
          var addString = "";
          int x = res.indexOf("User",0);
          if( x == -1)
          {
            addMessage(res);
          }
          else
          {
             for(int i = 0 ; i < x  ; i++)
             {
                addString += res[i];
             }
             addMessage(addString);
          }
        });
      }
    }
  }

  addMessage(String message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
  addClickableMessage(String message , String url)
  {
      messages.add({'message': message, 'isUserMessage': false , 'url' : url});
  }
}
