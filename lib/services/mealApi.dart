import 'dart:convert';

import 'package:food_recipe/models/meals.dart';
import 'package:http/http.dart' as http;

class MealApi{

var client = http.Client();

Future<Categorymeal> fetchMeal(String cat) async{

var response =await client.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/filter.php?c=$cat'));
if (response.statusCode == 200) {
  var body = response.body;
var decodejson = jsonDecode(body);
return Categorymeal.fromJson(decodejson);
  
} else {
  throw Exception('a error occured---');
}
}

}