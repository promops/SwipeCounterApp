import 'package:flutter/material.dart';

import 'package:swipe_counter/view/main_page/main_page.dart';

void main() {
  runApp(SwipeCounterApp());
}

class SwipeCounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
