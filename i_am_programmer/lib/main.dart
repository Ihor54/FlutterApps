import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlue[200],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text("I am coder!"),
        ),
        body: Center(
          child: Image(
            image: AssetImage("images/programmer.jpg"),
          ),
        ),
      ),
    ),
  );
}
