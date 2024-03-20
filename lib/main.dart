import 'package:flutter/material.dart';
import 'pages/mainPage.dart';

void main() {
  runApp( const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Nombre mystère",
      home: MainPage()
  ));
}