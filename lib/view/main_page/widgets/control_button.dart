import 'package:flutter/material.dart';
import 'package:swipe_counter/styles/colors.dart';

class ControlButton extends StatelessWidget {
  final String title;
  final Function action;

  const ControlButton({Key key, this.title, this.action}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.action,
        child: Container(
            width: 40,
            height: 40,
            color: CONTROL_BUTTON_COLOR,
            child: Center(
                child: Text(title,
                    style: TextStyle(color: Colors.white, fontSize: 22)))));
  }
}
