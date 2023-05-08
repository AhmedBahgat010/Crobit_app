class DiseasesModel {
 late int id;
 late  String name;
 late  String description;
 late String sugestedTreatment;


  DiseasesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sugestedTreatment = json['sugestedTreatment'];


    print(id);

  }


}


class HasDiseasesModel {
  int? id;
  int? photoId;
  String? date;
  int? diseasesID;


  HasDiseasesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photoId = json['photoId'];
    date = json['date'];
    diseasesID = json['diseasesID'];
  }


}

class PhotoDiseasesModel {
  int? id;
  String? date;
  String? photo;


  PhotoDiseasesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    photo = json['photo'];
  }

}
class DescriptionDiseasesModel {
  int? id;
  String? name;
  String? description;
  String? sugestedTreatment;

  DescriptionDiseasesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sugestedTreatment = json['sugestedTreatment'];
  }


}