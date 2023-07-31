


import 'package:meal/models/meals_category.dart';

class MealState {


  final List<MealsCategory> mealCategory;
  final bool isLoad;
  final String errMsg;
  final String searchText;


  MealState({required this.mealCategory, required this.isLoad, required this.errMsg, required this.searchText});


  MealState.initState() : mealCategory = [], isLoad = false, errMsg = '', searchText = '';


  MealState copyWith({bool? isLoad, String? errMsg, List<MealsCategory>? mealCategory, String? searchText}){
    return MealState(
        mealCategory: mealCategory ?? this.mealCategory,
        isLoad: isLoad ?? this.isLoad,
        errMsg: errMsg ?? this.errMsg,
        searchText: searchText ?? this.searchText,
    );
  }


}