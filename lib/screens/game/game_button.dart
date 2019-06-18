import 'package:flutter/material.dart';

class GameButton {
  final int id;
  String text;
  Color backgroundColor;
  bool enabled;

  GameButton(
      {this.id,
      this.text = "",
      this.backgroundColor = Colors.grey,
      this.enabled = true});
}
