import 'package:covid_tracker_app_flutter/screens/my_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountriesList extends StatelessWidget {
  final String countryName;
  final String countryFlag;
  final String activeCases;
  final String totalDeaths;
  final String totalRecovered;

  CountriesList({
    required this.countryName,
    required this.countryFlag,
    required this.activeCases,
    required this.totalDeaths,
    required this.totalRecovered
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomDialog(countryName: countryName, countryFlag: countryFlag, activeCases: activeCases, totalDeaths: totalDeaths, totalRecovered: totalRecovered);
              }
          );
        },
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(countryFlag), fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  countryName,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
