import 'dart:convert';

import 'package:covid_tracker_app_flutter/components/component_covid_records.dart';
import 'package:covid_tracker_app_flutter/models/WorldRecordsModel.dart';
import 'package:covid_tracker_app_flutter/screens/countries_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class WorldStateScreen extends StatefulWidget {
  @override
  _WorldStateScreenState createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen> {


  Future<WorldRecordsModel?> getWorldCovidStates() async {
    var response = await http.get(Uri.parse("https://disease.sh/v3/covid-19/all"));
    var data = json.decode(response.body);
    print(data);
    if(response.statusCode == 200) {
      return WorldRecordsModel.fromJson(data);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Tracker App"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "World Covid Records",
                style: TextStyle(
                    fontSize: 30,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 40,),
              StreamBuilder<WorldRecordsModel?>(
                stream: getWorldCovidStates().asStream(),
                builder: (context, snapshots){
                  if(!snapshots.hasData){
                    return CircularProgressIndicator();
                  }else{
                    return  Container(
                      child: Column(
                        children: [
                          Card(
                            elevation: 5,
                            color: Colors.teal,
                            child:
                              CovidRecords(title: "Active cases", value: snapshots.data!.active.toString()),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.teal,
                            child:
                            CovidRecords(title: "Today cases", value: snapshots.data!.todayCases.toString()),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.red,
                            child:
                            CovidRecords(title: "Today deaths", value: snapshots.data!.todayDeaths.toString()),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.red,
                            child:
                            CovidRecords(title: "Total deaths", value: snapshots.data!.deaths.toString()),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.red,
                            child:
                            CovidRecords(title: "Critical", value: snapshots.data!.critical.toString()),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.green,
                            child:
                            CovidRecords(title: "Total recovered", value: snapshots.data!.recovered.toString()),
                          ),
                          Card(
                            elevation: 5,
                            color: Colors.green,
                            child:
                            CovidRecords(title: "Today recovered", value: snapshots.data!.todayRecovered.toString()),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 40,),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    'Country Records Tracker',
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    onSurface: Colors.grey,
                    elevation: 5
                  ),
                  onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CountryList()
                          )
                      );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
