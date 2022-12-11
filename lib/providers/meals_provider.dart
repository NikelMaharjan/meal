


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal_category.dart';
import 'package:meal/services/meal_services.dart';

final mealsAllCategoryProvider = FutureProvider((ref) => MealServices.getAllCategory());

final mealsCategoryProvider = FutureProvider.family((ref, String category) => MealServices.getMealsByCategory(category));

final mealProvider = FutureProvider.family((ref, String id) => MealServices.getSingleMeals(id));

final randomMealProvider = FutureProvider((ref) => MealServices.getRandomMeals());
