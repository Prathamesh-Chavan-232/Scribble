import 'package:flutter/material.dart';
import 'package:untitled5/draw.dart';
import 'package:untitled5/draw_page.dart';
import './home.dart';
import './draw_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(
      primarySwatch: Colors.amber,
    ),
    home:const DrawPage(),
    );
        }
}