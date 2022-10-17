class ProductModel{
  late int id;
  late String name;
  late int price;
  late String description;
  late int stock;
  late String category;
  late bool status;
  late  String rate;
  late String image;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    stock = json['stock'];
    category = json['category'];
    status = json['status'];
    rate = json['rate'];
    if (json['images'] != null) {
      List<Images> imagesData = <Images>[];
      json['images'].forEach((v) {
        imagesData.add(Images.fromJson(v));
      });
      image =imagesData[0].image!;
    }
  }

}

class Images {
  String? image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    return data;
  }
}