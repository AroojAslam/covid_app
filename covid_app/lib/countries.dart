import 'package:covid_app/WorldStates.dart';
import 'package:covid_app/states_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'country details.dart';

class countriesData extends StatefulWidget {
  const countriesData({super.key});

  @override
  State<countriesData> createState() => _countriesDataState();
}

class _countriesDataState extends State<countriesData> {
  TextEditingController searchColler =TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return  Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              onChanged: (value){
                setState(() {

                });
              },
              controller: searchColler,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Search with Country Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
            ),
          ),
          Expanded(child:FutureBuilder(
            future: statesServices.countriesStatesApi(),
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String name =snapshot.data![index]['country'];
                    if(searchColler.text.isEmpty){
                      return Column(children: [
                        InkWell(

                          child: ListTile(

                            leading:  Image(
                                height :40,
                                width: 40,
                                image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()
                                )
                            ),

                            title:Text(snapshot.data![index]['country'].toString()),
                            subtitle: Text(snapshot.data![index]['cases'].toString()),
                          ),
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                              builder: (context) => countryDetails(
                                image:snapshot.data![index]['countryInfo']['flag'] ,
                                active:snapshot.data![index]['active'] ,
                                name:snapshot.data![index]['country'] ,
                                totalCase: snapshot.data![index]['cases'],
                                totalDeaths:snapshot.data![index]['deaths'] ,
                                todayRecovered:snapshot.data![index]['todayRecovered']
                                ,),));
                          },
                        ),
                      ],);

                    }else if(name.toLowerCase().contains(searchColler.text.toLowerCase())){
                      return Column(children: [
                        InkWell(

                          child: ListTile(

                            leading:  Image(
                                height :40,
                                width: 40,
                                image: NetworkImage(snapshot.data![index]['countryInfo']['flag'].toString()
                                )
                            ),

                            title:Text(snapshot.data![index]['country'].toString()),
                            subtitle: Text(snapshot.data![index]['cases'].toString()),
                          ),
                          onTap: (){
                            Navigator.push(
                                context, MaterialPageRoute(
                              builder: (context) => countryDetails(
                                image:snapshot.data![index]['countryInfo']['flag'] ,
                                active:snapshot.data![index]['active'] ,
                                name:snapshot.data![index]['country'] ,
                                totalCase: snapshot.data![index]['cases'],
                                totalDeaths:snapshot.data![index]['deaths'] ,
                                todayRecovered:snapshot.data![index]['todayRecovered']
                                ,),));
                          },
                        ),
                      ],);
                    }else{
                      return Container();
                    }

                },);

              }else{
                return Text('LOADING..');

              }


            },
          ))
        ],
      ),
    );
  }
}
