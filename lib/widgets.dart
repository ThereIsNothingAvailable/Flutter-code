import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Welcome",
            style: TextStyle(
              fontSize: 23.5,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              top: 10.0,
            ),
            child: Text(
              "We hope you enjoy using this app and it helps you in all your tasks! Click on get started to start using it now! ",
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF86829D),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
