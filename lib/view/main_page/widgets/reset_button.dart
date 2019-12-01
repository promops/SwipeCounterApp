import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final Function onTap;

  const ResetButton({Key key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: 160,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 234, 114, 106),
              borderRadius: BorderRadius.circular(24)),
          child: Text('Reset',
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ));
  }
}
