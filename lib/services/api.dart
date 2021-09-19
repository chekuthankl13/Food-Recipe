import 'package:food_recipe/models/recipe.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<Recipe> fetchRecipe() async {
    var client = http.Client();
    var response = await client.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));

    if (response.statusCode == 200) {
      var body = response.body;
      var decodejson = jsonDecode(body);
      print('----- $decodejson');
      return Recipe.fromJson(decodejson);
    } else {
      throw Exception('failed to connect server');
    }
  }
}
