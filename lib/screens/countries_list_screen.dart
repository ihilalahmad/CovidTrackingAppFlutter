import 'package:covid_tracker_app_flutter/components/component_countries_list.dart';
import 'package:covid_tracker_app_flutter/models/countries_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CountryList extends StatefulWidget {
  const CountryList({Key? key}) : super(key: key);

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List<CountriesListModel> countriesList = [];

  Future<CountriesListModel?> getCountriesList() async {
    var response =
        await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));
    var data = json.decode(response.body);

    if (response.statusCode == 200) {
      setState(() {
        for (Map i in data) {
          countriesList.add(CountriesListModel.fromJson(i));
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Countries List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: countriesList.length,
                  itemBuilder: (context, index) {

                    return CountriesList(
                        countryName: countriesList[index].country.toString(),
                        countryFlag: countriesList[index].countryInfo!.flag.toString(),
                        activeCases: countriesList[index].active.toString(),
                        totalDeaths: countriesList[index].deaths.toString(),
                        totalRecovered: countriesList[index].recovered.toString(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
