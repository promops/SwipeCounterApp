import 'package:flutter/material.dart';

class SwipeCard extends StatelessWidget {
  final double size;
  final int count;

  SwipeCard({this.size, this.count});

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[900],
              offset: Offset(0, 1),
            )
          ]),
      height: size,
      width: size,
      child: Center(
        child: Text('$count', style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
