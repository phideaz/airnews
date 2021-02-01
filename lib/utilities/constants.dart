import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFD6307D);
const kBackgroundColor = Color(0xFFFCFCFC);
const kJudulTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
      fontSize: 18,
);

final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-0]+\.[a-zA-Z]+");