import 'package:flutter/material.dart';
import 'homescreen.dart';

void main()
{
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: AutofillHints.language,
    ),
    home: homescreen(),
    debugShowCheckedModeBanner: false,
  ));
}
