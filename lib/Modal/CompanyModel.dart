class CompanyModel {
  String? status;
  CompanyInfo? companyInfo;

  CompanyModel({this.status, this.companyInfo});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    companyInfo = json['companyInfo'] != null
        ? new CompanyInfo.fromJson(json['companyInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.companyInfo != null) {
      data['companyInfo'] = this.companyInfo!.toJson();
    }
    return data;
  }
}

class CompanyInfo {
  String? iD;
  String? title;
  String? logo;
  String? email;
  String? phone;
  String? regNo;
  String? dlno;
  String? gst;
  String? fssai;
  String? hcharge;
  String? opec;
  String? address;
  String? description;
  String? links;
  String? udyamNum;

  CompanyInfo(
      {this.iD,
        this.title,
        this.logo,
        this.email,
        this.phone,
        this.regNo,
        this.dlno,
        this.gst,
        this.fssai,
        this.hcharge,
        this.opec,
        this.address,
        this.description,
        this.links,
        this.udyamNum});

  CompanyInfo.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    title = json['Title'];
    logo = json['Logo'];
    email = json['Email'];
    phone = json['Phone'];
    regNo = json['reg_no'];
    dlno = json['Dlno'];
    gst = json['gst'];
    fssai = json['fssai'];
    hcharge = json['hcharge'];
    opec = json['opec'];
    address = json['Address'];
    description = json['Description'];
    links = json['Links'];
    udyamNum = json['udyam_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Title'] = this.title;
    data['Logo'] = this.logo;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['reg_no'] = this.regNo;
    data['Dlno'] = this.dlno;
    data['gst'] = this.gst;
    data['fssai'] = this.fssai;
    data['hcharge'] = this.hcharge;
    data['opec'] = this.opec;
    data['Address'] = this.address;
    data['Description'] = this.description;
    data['Links'] = this.links;
    data['udyam_num'] = this.udyamNum;
    return data;
  }
}
