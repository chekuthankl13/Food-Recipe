// // To parse this JSON data, do
// //
// //     final recipe = recipeFromJson(jsonString);

// ignore: unused_import

import 'dart:convert';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));

String recipeToJson(Recipe data) => json.encode(data.toJson());

class Recipe {
  Recipe({
    required this.categories,
  });

  List<Category> categories;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  Category({
    // required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    // required this.strCategoryDescription,
  });

  // String idCategory;
  String strCategory;
  String strCategoryThumb;
  // String strCategoryDescription;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        // idCategory: json["idCategory"],
        strCategory: json["strCategory"],
        strCategoryThumb: json["strCategoryThumb"],
        // strCategoryDescription: json["strCategoryDescription"],
      );

  Map<String, dynamic> toJson() => {
        // "idCategory": idCategory,
        "strCategory": strCategory,
        "strCategoryThumb": strCategoryThumb,
        // "strCategoryDescription": strCategoryDescription,
      };
}





// class Recipe {
//   final String? strCategory;
//   final String strImage;

//   Recipe({required this.strCategory, required this.strImage});

//   factory Recipe.fromJson(Map<String, dynamic> json){
//     return Recipe(strCategory: json["strCategory"], strImage: json["strCategoryThumb"]);
//   }


// }