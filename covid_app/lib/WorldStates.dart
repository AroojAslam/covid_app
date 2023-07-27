
import 'package:covid_app/countries.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';
import 'package:covid_app/models/worldState.dart';
import 'package:covid_app/states_services.dart';
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
    StatesServices statesServices = StatesServices();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .01,),
            FutureBuilder(
              future: statesServices.fetchWorldStates(),
              builder: (context,AsyncSnapshot<WorldStates> snapshot) {
                if(!snapshot.hasData){
                  return Expanded(
                      child:Text('loading..'));

                }else{
             return Column(children: [
               PieChart(
                 dataMap: {
                   'total':double.parse(snapshot.data!.cases.toString()),
                   'Recover':double.parse(snapshot.data!.recovered.toString()),
                   'Deaths':double.parse(snapshot.data!.deaths.toString()),

                 },
                 chartValuesOptions: ChartValuesOptions(
                     showChartValuesInPercentage: true),
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
               SizedBox(height: 20,),
               ShowData(title:'Cases' ,value: snapshot.data!.cases.toString() ),
               ShowData(title:'Active' ,value: snapshot.data!.active.toString() ),
               ShowData(title:'Critical' ,value:snapshot.data!.critical.toString() ),
               ShowData(title:'Today Cases' ,value:snapshot.data!.todayCases.toString() ),
               ShowData(title:'Today Deaths' ,value:snapshot.data!.todayDeaths.toString() ),
               ShowData(title:'death' ,value:snapshot.data!.todayRecovered.toString() ),
               SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: InkWell(
                   child: Container(
                     height: 50,
                     decoration: BoxDecoration(
                       color: Colors.purple,
                       borderRadius: BorderRadius.circular(20),
                     ),
                     child: Center(
                       child:
                       Text('Track Countires',style: TextStyle(color: Colors.white),),),
                   ),
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(
                       builder: (context) => countriesData(),));
                   },
                 ),
               ),

               ],);
                }

            },),

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
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
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

