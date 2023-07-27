import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class countriesData extends StatefulWidget {
  const countriesData({super.key});

  @override
  State<countriesData> createState() => _countriesDataState();
}

class _countriesDataState extends State<countriesData> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text('Countries data')
        ],
      ),
    );
  }
}
