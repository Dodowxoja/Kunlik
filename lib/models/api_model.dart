class ApiModel {
  ApiModel({
    this.category,
    this.name,
  });

  String? category;
  Name? name;

  factory ApiModel.fromJson(Map<String, dynamic> json) => ApiModel(
        category: json["category"],
        name: Name.fromJson(json["name"]),
      );
}

class Name {
  Name({
    this.type,
    this.img,
    this.color,
    this.price,
    this.detail,
  });

  String? type;
  String? img;
  String? color;
  String? price;
  String? detail;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        type: json["type"],
        img: json["img"],
        color: json["color"],
        price: json["price"],
        detail: json["detail"],
      );
}
