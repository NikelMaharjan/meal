
import 'package:dio/dio.dart';
import 'package:meal/api.dart';
import 'package:meal/api_exceptions.dart';
import 'package:meal/models/meal_category.dart';
import 'package:meal/models/meals.dart';

class MealServices {


  static Future<List<MealsCategory>> getAllCategory () async{

    final dio = Dio();

    try{

      final response = await dio.get(Api.getAllCategory);
      final data = response.data['categories'];
      final mealsCategoryData = (data as List).map((e) => MealsCategory.fromJson(e)).toList();
      return mealsCategoryData;

    }

    on DioError catch  (err){
      throw DioException.fromDioError(err).errorMessage;

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

    on DioError catch  (err){
      throw DioException.fromDioError(err).errorMessage;



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

    on DioError catch  (err){
      throw DioException.fromDioError(err).errorMessage;



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

    on DioError catch  (err){

      throw DioException.fromDioError(err).errorMessage;

    }

  }



}