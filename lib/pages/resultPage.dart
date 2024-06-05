import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class ResultPage extends StatefulWidget {
  ResultPage({required this.houseName});

  final String houseName;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  List<dynamic>? houseInfo;
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchHouseInfo();
  }

  Future<void> fetchHouseInfo() async {
    try {
      final response =
          await Dio().get('https://api.potterdb.com/v1/characters');

      if (response.statusCode == 200) {
        List<dynamic> characters = response.data['data'];

        setState(() {
          houseInfo = characters
              .where((character) =>
                  character['attributes']['house'] == widget.houseName)
              .toList();

          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Failed to load house info';
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'An error occurred: $error';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sua casa é:  ' + widget.houseName),
        backgroundColor: Colors.black,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                  itemCount: houseInfo?.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            leading: Image.network(
                              houseInfo?[index]['attributes']['image'] ?? '',
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            ),
                            title: Text(
                                houseInfo?[index]['attributes']['name'] ?? ''),
                            subtitle: Text(houseInfo?[index]['attributes']
                                    ['species'] ??
                                '')));
                  },
                ),
    );
  }
}
