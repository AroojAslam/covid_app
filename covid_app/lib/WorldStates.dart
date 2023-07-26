

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class worldStates extends StatefulWidget {
  const worldStates({super.key});

  @override
  State<worldStates> createState() => _worldStatesState();
}

class _worldStatesState extends State<worldStates> with TickerProviderStateMixin {
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
    // Timer(Duration(seconds:5 ),() => Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => worldStates() ,)),);
  }
  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .01,),
            PieChart(
            dataMap: {
              'total':200,
              'Recover':200,
              'Deaths':200,

            },
            animationDuration: Duration(milliseconds: 800),
            chartLegendSpacing: 20,
            chartRadius: MediaQuery.of(context).size.width / 3.9,
            colorList: colorList,
            chartType: ChartType.disc,
            ringStrokeWidth: 20,
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              // showLegends: true,
              legendShape:BoxShape.rectangle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            // gradientList: ---To add gradient colors---
            // emptyColorGradient: ---Empty Color gradient---
          ),
            ShowData(title:'totall' ,value:'200' ),
            ShowData(title:'recover' ,value:'200' ),
            ShowData(title:'death' ,value:'200' ),
          ],

        ),
      ),

    );
  }
}
class ShowData extends StatelessWidget {
   ShowData({super.key,  required this.title, required this.value });
String title,value;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text(title),
             Text(value),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

