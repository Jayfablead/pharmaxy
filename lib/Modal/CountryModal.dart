class CountryModal {
  String? status;
  String? message;
  List<Countries>? countries;

  CountryModal({this.status, this.message, this.countries});

  CountryModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(new Countries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.countries != null) {
      data['countries'] = this.countries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Countries {
  String? countryID;
  String? countryCode;
  String? countryName;

  Countries({this.countryID, this.countryCode, this.countryName});

  Countries.fromJson(Map<String, dynamic> json) {
    countryID = json['CountryID'];
    countryCode = json['CountryCode'];
    countryName = json['CountryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CountryID'] = this.countryID;
    data['CountryCode'] = this.countryCode;
    data['CountryName'] = this.countryName;
    return data;
  }
}
