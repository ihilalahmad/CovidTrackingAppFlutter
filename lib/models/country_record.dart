class CountryRecordModel {

  int? deaths;
  int? recovered;
  int? active;

  CountryRecordModel(
      {
        this.deaths,
        this.recovered,
        this.active,
       });

  CountryRecordModel.fromJson(Map<dynamic, dynamic> json) {
    deaths = json['deaths'];
    recovered = json['recovered'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deaths'] = this.deaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    return data;
  }
}
