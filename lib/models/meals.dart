// To parse this JSON data, do
//
//     final categorymeal = categorymealFromJson(jsonString);

import 'dart:convert';

Categorymeal categorymealFromJson(String str) => Categorymeal.fromJson(json.decode(str));

String categorymealToJson(Categorymeal data) => json.encode(data.toJson());

class Categorymeal {
    Categorymeal({
        required this.meals,
    });

    List<Meal> meals;

    factory Categorymeal.fromJson(Map<String, dynamic> json) => Categorymeal(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
    };
}

class Meal {
    Meal({
        required this.strMeal,
        required this.strMealThumb,
        required this.idMeal,
    });

    String strMeal;
    String strMealThumb;
    String idMeal;

    factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
    );

    Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
    };
}
