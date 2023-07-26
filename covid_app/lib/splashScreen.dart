import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'WorldStates.dart';
import 'main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =AnimationController(
    duration: const Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:5 ),() => Navigator.push(
        context, MaterialPageRoute(builder: (context) => worldStates() ,)),);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              AnimatedBuilder(animation: _controller,
                  child:Container(
                    height: 100,
                    width: 100,
                    child:Center(
                      child: Image(image: AssetImage('assets/images/logo.png'),),
                    ),
                  ) ,
                  builder: (BuildContext context,Widget? child){
                return Transform.flip(
                child: child
                );
              }),
              SizedBox(height: 30,),
              Text('COVID-19 \nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),)

            ],
          ),
        ),
      ),
    );
  }
}
