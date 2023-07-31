
import 'package:dio/dio.dart';
import 'package:meal/api.dart';
import 'package:meal/api_exception.dart';
import 'package:meal/models/meals.dart';
import 'package:meal/models/meals_category.dart';

class MealServices {


  static Future<List<MealsCategory>> getAllCategory () async{

    final dio = Dio();

    try{

      final response = await dio.get(Api.getAllCategory);
      final data = response.data['categories'];
      final mealsCategoryData = (data as List).map((e) => MealsCategory.fromJson(e)).toList();
      return mealsCategoryData;

    }

    on DioException catch  (err){
      throw DioExceptions.getDioError(err);

    }

  }

  static Future<List<MealsCategory>> getMealsByCategory (String category) async{
    print(category);

    final dio = Dio();

    try{

      final response = await dio.get(Api.getMealByCategory, queryParameters: {
        "c" : category,
      });
      final data = response.data["meals"];
      final mealsCategoryData = (data as List).map((e) => MealsCategory.fromJson(e)).toList();
      return mealsCategoryData;
    }

    on DioException catch  (err){
      throw DioExceptions.getDioError(err);



    }

  }


  static Future<List<Meals>> getSearchedMeals ({required String searchText}) async{

    print("searchText is $searchText");

    final dio = Dio();

    try{

      final response = await dio.get(Api.getSearchedMeal, queryParameters: {
        "s" : searchText,
      });
      final data = response.data["meals"];
      final meals = (data as List).map((e) => Meals.fromJson(e)).toList();
      return meals;
    }

    on DioException catch  (err){
      print("error is $err");
      throw DioExceptions.getDioError(err);



    }

  }


  static Future<List<Meals>> getSingleMeals (String id) async{     //singleMeals also returns array (check api)

    final dio = Dio();

    try{

      final response = await dio.get(Api.getSingleMeal, queryParameters: {
        "i" : id,
      });
      final data = response.data["meals"];
      final mealsCategoryData = (data as List).map((e) => Meals.fromJson(e)).toList();
      return mealsCategoryData;
    }

    on DioException catch  (err){
      throw DioExceptions.getDioError(err);



    }

  }

  static Future<List<MealsCategory>> getRandomMeals () async{

    final dio = Dio();

    try{

      final response = await dio.get(Api.getRandomMeal);
      final data = response.data["meals"];
      final mealsCategoryData = (data as List).map((e) => MealsCategory.fromJson(e)).toList();
      return mealsCategoryData;
    }

    on DioException catch  (err){

      throw DioExceptions.getDioError(err);

    }

  }



}