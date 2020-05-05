import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:th_app/util/socket_singleton.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


class MyHomePageOne extends StatefulWidget {
  
  @override
  MyHomePageOneState createState() {
    return new MyHomePageOneState();
  }
}

class MyHomePageOneState extends State<MyHomePageOne> {

  TextEditingController editingController = new TextEditingController();
  bool nameTaken = false;
  String NAME = "name";
  String MESSAGE = "message";

  SocketSingleton _socket = SocketSingleton();
  String username = "";
  List<ChatPerson> messages = List();

  @override
  void initState() {
    super.initState();
    username = _socket.name;
  }

  getData () {
    print("Hello all");
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _changeName(),
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => _changeName(),
          ),
        ],
        title: new Text("Hi $username"),
      ),
      body:
      new Column(
        children: <Widget>[
          new StreamBuilder(
            stream: _socket.channel.stream,
            builder: (context, snapshot) {

              if(snapshot.data == null){
                messages.clear();
                getData();
                return Flexible(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Center(child: Text(
                      nameTaken ?
                      "Welcome $username!!" :
                        'Enter the Your name and then start a chat'
                    )),
                  ),
                );
              }else {

                // {
                //   "name" : "ajit",
                //   "data" : "ajhskjsf shf kjsdhfkdshfk hskdfhkdshf"
                // }

                String username = json.decode(snapshot.data)['name'];
                String message = json.decode(snapshot.data)['data'];


                messages.insert(0, ChatPerson(
                    name : username,
                    message: message,
                    image : ''
                ));

                return Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: ListView.builder(
                      reverse: false,
                      shrinkWrap: true,
                      itemCount: messages.length,
                      itemBuilder: (context, index){
                        ChatPerson _cp = messages[index];
                        return Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                radius: 20.0,
                                backgroundImage: NetworkImage("https://api.adorable.io/avatars/${_cp.name}"),
                                backgroundColor: Colors.white12,
                              ),
                              title: Text(_cp.name ?? "No name"),
                              subtitle: Text(_cp.message ?? "No message"),
                            ),
                            Divider(height: 1,)
                          ],
                        );
                      }),
                );
              }

            },
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _textComposerWidget(),
          ),
        ],
      )
    );
  }

  void _sendMyMessage(String enteredData) {

    //bool nameTaken = false;
    // {
    //   "type" : "name",
    //   "data" : "Anant"
    // }

    //bool nameTaken = type;
    // {
    //   "type" : "message",
    //   "data" : "ajhskjsf shf kjsdhfkdshfk hskdfhkdshf"
    // }

    if (enteredData.isNotEmpty) {

      // s.send
      _socket.channel.sink.add(
          json.encode({
            "type": nameTaken ? MESSAGE : NAME,
            "data": enteredData
          }));
      editingController.text = "";

      if(!nameTaken) {
        setState(() {
          nameTaken = true;
          username = enteredData;
        });
      }
    }
  }


  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration:
                new InputDecoration.collapsed(hintText: nameTaken ? "Send a message" : "Please enter your name"),
                controller: editingController,
                onSubmitted: _sendMyMessage,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _sendMyMessage(editingController.text),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    //widget.channel.sink.close();
    super.dispose();
  }

  _changeName() {
    setState(() {
      nameTaken = false;
    });
  }
}

class ChatPerson {
  String name;
  String message;
  String image;

  ChatPerson({this.name, this.message, this.image});


}