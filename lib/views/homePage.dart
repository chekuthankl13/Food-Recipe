import 'package:flutter/material.dart';
import 'package:food_recipe/models/recipe.dart';
import 'package:food_recipe/services/api.dart';
import 'package:food_recipe/views/recipe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}  

class _HomePageState extends State<HomePage> {
  late Future<Recipe> recipe;

  @override
  void initState() {
    
   
      recipe = ApiService().fetchRecipe();
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        leading: Icon(
          Icons.local_restaurant,
          color: Colors.black,
          size: 35,
        ), 
        title: Text('food recipe'),
      ),
      body: FutureBuilder<Recipe>(
          future: recipe,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.categories.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodRecipe(category:snapshot.data!.categories[index].strCategory)));
                    print(
                      'you clicked -${snapshot.data!.categories[index].strCategory}');
                  },
                  splashColor: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(snapshot.data!.categories[index].strCategoryThumb),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Container(
                        color: Colors.black26,
                        child: Text(
                          snapshot.data!.categories[index].strCategory,
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
              return Center(
                child: CircularProgressIndicator(),
              );
              
            }
          }),
    );
  }
}
