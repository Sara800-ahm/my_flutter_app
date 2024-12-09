import 'package:flutter/material.dart';
import 'simple_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Form Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: sarahFormPage(),
    );
  }
}
