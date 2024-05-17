// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discover Your House',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _animalController = TextEditingController();
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _hobbyController = TextEditingController();
  final TextEditingController _disciplineController = TextEditingController();

  bool validateField(String text) {
    if (text.trim().length >= 3) {
      return true;
    }
    return false;
  }

  bool validateForm() {
    if (_colorController.text.trim().length < 3 &&
        _animalController.text.trim().length < 3 &&
        _foodController.text.trim().length < 3 &&
        _hobbyController.text.trim().length < 3 &&
        _disciplineController.text.trim().length < 3) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
          decoration:
              const BoxDecoration(color: Color.fromRGBO(230, 230, 230, 1)),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.black),
                      left: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.black),
                      right: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.black),
                      top: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.black)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Welcome to Hogwarts!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Qual sua cor favorita?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _colorController,
                    cursorColor: const Color.fromRGBO(140, 10, 140, 1),
                    decoration: const InputDecoration(
                        hintText: 'Cor favorita',
                        labelText: 'Cor favorita',
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(140, 10, 140, 1)),
                        focusColor: Color.fromRGBO(140, 10, 140, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(140, 10, 140, 1),
                                width: 2,
                                strokeAlign: 2,
                                style: BorderStyle.solid)),
                        hoverColor: Color.fromRGBO(140, 10, 140, 1)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Qual seu animal favorito?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _animalController,
                    cursorColor: const Color.fromRGBO(140, 10, 140, 1),
                    decoration: const InputDecoration(
                        hintText: 'Animal favorito',
                        labelText: 'Animal favorito',
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(140, 10, 140, 1)),
                        focusColor: Color.fromRGBO(140, 10, 140, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(140, 10, 140, 1),
                                width: 2,
                                strokeAlign: 2,
                                style: BorderStyle.solid)),
                        hoverColor: Color.fromRGBO(140, 10, 140, 1)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Qual sua comida favorita?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _foodController,
                    cursorColor: const Color.fromRGBO(140, 10, 140, 1),
                    decoration: const InputDecoration(
                        hintText: 'Comida favorita',
                        labelText: 'Comida favorita',
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(140, 10, 140, 1)),
                        focusColor: Color.fromRGBO(140, 10, 140, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(140, 10, 140, 1),
                                width: 2,
                                strokeAlign: 2,
                                style: BorderStyle.solid)),
                        hoverColor: Color.fromRGBO(140, 10, 140, 1)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Qual seu hobbie favorito?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _hobbyController,
                    cursorColor: const Color.fromRGBO(140, 10, 140, 1),
                    decoration: const InputDecoration(
                        hintText: 'Hobbie favorito',
                        labelText: 'Hobbie favorito',
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(140, 10, 140, 1)),
                        focusColor: Color.fromRGBO(140, 10, 140, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(140, 10, 140, 1),
                                width: 2,
                                strokeAlign: 2,
                                style: BorderStyle.solid)),
                        hoverColor: Color.fromRGBO(140, 10, 140, 1)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Qual sua matéria favorita?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _disciplineController,
                    cursorColor: const Color.fromRGBO(140, 10, 140, 1),
                    decoration: const InputDecoration(
                        hintText: 'Matéria favorita',
                        labelText: 'Matéria favorita',
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(140, 10, 140, 1)),
                        focusColor: Color.fromRGBO(140, 10, 140, 1),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                color: Color.fromRGBO(140, 10, 140, 1),
                                width: 2,
                                strokeAlign: 2,
                                style: BorderStyle.solid)),
                        hoverColor: Color.fromRGBO(140, 10, 140, 1)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Center(
                    child: InkWell(
                        onTap: () {
                          if (validateForm()) {
                            print('foi');
                            //TODO Chamar página secundária e método para descobrir a casa
                            // Navigator.push(context, route);
                          }
                          print('foi não');
      
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(140, 10, 140, 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Text(
                            'Descubra sua casa',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
