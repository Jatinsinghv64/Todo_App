import 'package:flutter/material.dart';
import 'package:flutter_todo_app/My_Home_page.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner

      home: MyHomePage(),
    );
  }
}


