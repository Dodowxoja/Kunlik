import 'package:flutter/material.dart';

class MyFlag {
  static CircleAvatar flag(flagName) {
    return CircleAvatar(
      radius: 10,
      backgroundImage: AssetImage('assets/icons/flags/$flagName.png'),
    );
  }
}