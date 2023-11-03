class CityModal {
  String? status;
  String? message;
  List<Cities>? cities;

  CityModal({this.status, this.message, this.cities});

  CityModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['cities'] != null) {
      cities = <Cities>[];
      json['cities'].forEach((v) {
        cities!.add(new Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.cities != null) {
      data['cities'] = this.cities!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cities {
  String? cityID;
  String? stateID;
  String? cityName;

  Cities({this.cityID, this.stateID, this.cityName});

  Cities.fromJson(Map<String, dynamic> json) {
    cityID = json['CityID'];
    stateID = json['StateID'];
    cityName = json['CityName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CityID'] = this.cityID;
    data['StateID'] = this.stateID;
    data['CityName'] = this.cityName;
    return data;
  }
}
