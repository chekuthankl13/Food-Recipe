import 'package:flutter/material.dart';
import 'package:food_recipe/models/meals.dart';

import 'package:food_recipe/services/mealApi.dart';

class FoodRecipe extends StatefulWidget {
   final String category;

   FoodRecipe({required this.category});

  @override
  _FoodRecipeState createState() => _FoodRecipeState();
}

class _FoodRecipeState extends State<FoodRecipe> {

  late Future<Categorymeal> _meals;

  @override
  void initState() {
    _meals = MealApi().fetchMeal(widget.category);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Categorymeal>(
        future: _meals,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.meals.length ,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    
                  },
                  splashColor: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data!.meals[index].strMealThumb),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Container(
                        color: Colors.black26,
                        child: Text(
                          snapshot.data!.meals[index].strMeal,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white60),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
        ),
    );
  }
}