







import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal_state.dart';
import 'package:meal/services/meal_services.dart';



final mealsAllCategoryProvider = FutureProvider((ref) => MealServices.getAllCategory());

final mealsCategoryProvider = FutureProvider.family((ref, String category) => MealServices.getMealsByCategory(category));

final mealProvider = FutureProvider.family((ref, String id) => MealServices.getSingleMeals(id));

final randomMealProvider = FutureProvider((ref) => MealServices.getRandomMeals());


final mealCategoryProvider = StateNotifierProvider<MealProvider, MealState>((ref) => MealProvider(MealState.initState()));


class MealProvider extends StateNotifier<MealState> {
  MealProvider(super.state){
    getMealsCategoryData();
  }


  Future<void> getMealsCategoryData() async{


    try{
      state = state.copyWith(isLoad: true);
      final response = await MealServices.getAllCategory();
      state = state.copyWith(
          isLoad: false,
          mealCategory: response,
          errMsg: ''
      );
    }

    catch(err) {
      state = state.copyWith(
        isLoad: false,
        errMsg: err.toString()
      );
    }


}














}