import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scribble_app/Screens/learning.dart';
import 'Screens/Drawing_page/draw_page.dart';
import 'Screens/learning.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MaterialApp(
      initialRoute: '/learning',
      routes: {
        '/draw_page': (screens) => const DrawPage(),
        '/learning':(context)=> MyWidget(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
