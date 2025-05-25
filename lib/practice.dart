import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: Colors.white, // You’ll probably need to set this too
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  home: Scaffold(
    appBar: AppBar(
      title: Text('hello world'),
      backgroundColor: Colors.pinkAccent,
      centerTitle: true,
    ),
    body: Center(
      child: Text('hello world again!!'),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.black,
      child: Text(
        'press !!!',
        style: TextStyle(
          fontSize: 15,
          color: Colors.amber,
        ),
      ),
    ),
  ),
));

