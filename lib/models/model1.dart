import 'dart:convert';

class User {
  final String name;
  final String weight;
  final String calories;
  final String proteins;
  final String image;

  User(
      {required this.name,
      required this.weight,
      required this.calories,
      required this.proteins,
      required this.image});

  Map<String, dynamic> toJson() => {
        'name': name,
        'weight': weight,
        'calories': calories,
        'proteins': proteins,
        'image': image
      };

  static fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      weight: json["weight"],
      calories: json["calories"],
      proteins: json["proteins"],
      image: json["image"]);
}
