class StateModal {
  String? status;
  String? message;
  List<States>? states;

  StateModal({this.status, this.message, this.states});

  StateModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(new States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.states != null) {
      data['states'] = this.states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  String? stateID;
  String? countryID;
  String? stateName;

  States({this.stateID, this.countryID, this.stateName});

  States.fromJson(Map<String, dynamic> json) {
    stateID = json['StateID'];
    countryID = json['CountryID'];
    stateName = json['StateName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['StateID'] = this.stateID;
    data['CountryID'] = this.countryID;
    data['StateName'] = this.stateName;
    return data;
  }
}
