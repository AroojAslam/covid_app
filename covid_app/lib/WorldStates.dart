

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class worldStates extends StatefulWidget {
  const worldStates({super.key});

  @override
  State<worldStates> createState() => _worldStatesState();
}

class _worldStatesState extends State<worldStates> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         body: Text('World States '),

      ),
    );
  }
}
