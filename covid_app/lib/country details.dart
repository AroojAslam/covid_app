import 'package:flutter/material.dart';

class countryDetails extends StatefulWidget {
  String name ;
  String image;
  int totalCase;
  int totalDeaths;
  int todayRecovered;
  int active;
   countryDetails({super.key,
   required this.name,
   required this.active,
   required this.totalCase,
   required this.todayRecovered,
   required this.image,
   required this.totalDeaths,
   });

  @override
  State<countryDetails> createState() => _countryDetailsState();
}

class _countryDetailsState extends State<countryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Image(image: NetworkImage(widget.image.toString())),
            SizedBox(height: 20,),
            ShowData(title:'Total Cases' ,value: widget.totalCase.toString() ,),
            ShowData(title:'Total Deaths' ,value: widget.totalDeaths.toString() ,),
            ShowData(title:'Today Recovered' ,value: widget.todayRecovered.toString() ,),
            ShowData(title:'Total Deaths' ,value: widget.totalDeaths.toString() ,),

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
