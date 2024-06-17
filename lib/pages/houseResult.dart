import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class House {
  final int id;
  final String name;
  final String description;
  final String founder;
  final String animal;
  final List<String> colors;

  House(
      {required this.id,
      required this.name,
      required this.description,
      required this.founder,
      required this.animal,
      required this.colors});
}

class HouseResult extends StatefulWidget {
  const HouseResult({super.key});

  @override
  State<HouseResult> createState() => _HouseResultState();
}

class _HouseResultState extends State<HouseResult> {
  House? house;

  Color color(int index) {
    return house != null && house!.colors.isNotEmpty
        ? Color(int.parse(house!.colors[index]))
        : Colors.white;
  }

  Image img(int index) {
    switch (index) {
      case 0:
        return Image.asset('assets/imgs/grifinoria.png');
      case 1:
        return Image.asset('assets/imgs/soncerina.png');
      case 2:
        return Image.asset('assets/imgs/corvinal.png');
      default:
        return Image.asset('assets/imgs/lufalufa.png');
    }
  }

  Future<void> fetchHouse() async {
    try {
      final response =
          await Dio().get("https://harry-api.onrender.com/houses/3");
      setState(() {
        house = House(
          id: response.data['id'],
          name: response.data['name'].toString(),
          description: response.data['description'].toString(),
          founder: response.data['founder'].toString(),
          animal: response.data['animal'].toString(),
          colors: List<String>.from(
              response.data['colors'].map((x) => x = "0xff$x")),
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchHouse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color(0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  house?.name ?? 'Carregando...',
                  style: TextStyle(
                      fontSize: 56, color: color(1), fontFamily: "HarryP"),
                ),
                Text(
                  house?.founder ?? 'Carregando...',
                  style: TextStyle(
                      fontSize: 23, color: color(1), fontFamily: "HarryP"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Center(
                    child: SizedBox(
                      width: 450.0,
                      height: 450.0,
                      child: Align(
                        alignment: Alignment.center,
                        child: img(house?.id ?? 0),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Text(
                        house?.description ?? 'Carregando...',
                        style: TextStyle(
                            fontSize: 25,
                            color: color(1),
                            fontFamily: "harryp"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
