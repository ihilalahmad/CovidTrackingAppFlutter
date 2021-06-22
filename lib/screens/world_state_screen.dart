import 'dart:convert';

import 'package:covid_tracker_app_flutter/models/WorldRecordsModel.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder<WorldRecordsModel?>(
                stream: getWorldCovidStates().asStream(),
                builder: (context, snapshots){
                  if(!snapshots.hasData){
                    return CircularProgressIndicator();
                  }else{
                    return  Card(
                      elevation: 5,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Active cases",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                                Text(
                                  snapshots.data!.active.toString(),
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
