class KunlikModels {
  KunlikModels({this.category, this.name});

  String? category;
  Name? name;

  factory KunlikModels.fromJson(Map<String, dynamic> json) => KunlikModels(
        category: json["category"],
        name: Name.fromJson(json["name"]),
      );
}

class Name {
  Name({this.type, this.img});

  String? type;
  String? img;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        type: json["type"],
        img: json["img"],
      );
}
