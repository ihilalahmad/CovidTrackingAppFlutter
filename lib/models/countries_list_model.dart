class CountriesListModel {
  String? country;
  CountryInfo? countryInfo;
  int? deaths;
  int? recovered;
  int? active;

  CountriesListModel(
      {
        this.country,
        this.countryInfo,
        this.deaths,
        this.recovered,
        this.active,
        });

  CountriesListModel.fromJson(Map<dynamic, dynamic> json) {
    country = json['country'];
    countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
    deaths = json['deaths'];
    recovered = json['recovered'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    if (this.countryInfo != null) {
      data['countryInfo'] = this.countryInfo!.toJson();
    }
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    return data;
  }
}

class CountryInfo {
  String? flag;

  CountryInfo({this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    return data;
  }
}
