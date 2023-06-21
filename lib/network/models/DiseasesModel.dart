class HasDiseasesModel {
  Photo? photo;
  Diseases? diseases;

  HasDiseasesModel({this.photo, this.diseases});

  HasDiseasesModel.fromJson(Map<String, dynamic> json) {
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    diseases = json['diseases'] != null
        ? new Diseases.fromJson(json['diseases'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.photo != null) {
      data['photo'] = this.photo!.toJson();
    }
    if (this.diseases != null) {
      data['diseases'] = this.diseases!.toJson();
    }
    return data;
  }
}

class Photo {
  int? id;
  String? date;
  String? photo;
  int? lan;
  int? long;

  Photo({this.id, this.date, this.photo, this.lan, this.long});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    photo = json['photo'];
    lan = json['lan'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date'] = this.date;
    data['photo'] = this.photo;
    data['lan'] = this.lan;
    data['long'] = this.long;
    return data;
  }
}

class Diseases {
  int? id;
  String? name;
  String? description;
  String? sugestedTreatment;
  int? type;

  Diseases(
      {this.id,
        this.name,
        this.description,
        this.sugestedTreatment,
        this.type});

  Diseases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sugestedTreatment = json['sugestedTreatment'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['sugestedTreatment'] = this.sugestedTreatment;
    data['type'] = this.type;
    return data;
  }
}