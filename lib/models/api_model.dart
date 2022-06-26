class ApiModels {
  ApiModels({
    this.name,
    this.img,
    this.category,
  });

  String? name;
  String? img;
  String? category;

  factory ApiModels.fromJson(Map<String, dynamic> json) => ApiModels(
        name: json["name"],
        img: json["img"],
        category: json["category"],
      );
}
