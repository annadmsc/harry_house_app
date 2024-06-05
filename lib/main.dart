import 'package:first_app/pages/homePage.dart';
import 'package:first_app/pages/resultPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResultPage(
        houseName: 'Gryffindor',
      )));
}





// SplashPage(duration: 5, goToPage: WelcomePage())