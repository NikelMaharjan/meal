



import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:meal/models/searchState.dart';
import 'package:meal/services/meal_services.dart';


final searchProvider = StateNotifierProvider.autoDispose<SearchProvider, SearchState>((ref) => SearchProvider(SearchState.initState()));

class SearchProvider extends StateNotifier<SearchState>{
  SearchProvider(super.state);
  
  
  Future<void> getSearchData ({required String searchText}) async {
    
    try{
      
      state = state.copyWith(isLoad: true, searchText: searchText);
      final response = await MealServices.getSearchedMeals(searchText: searchText);
      state = state.copyWith(
        isLoad: false,
        meals: response,
        errMsg: ''
      );


    }
    
    catch (err){
      
      state = state.copyWith(
          isLoad: false,
          errMsg: "Results not found",
              
      );
    }
    
    
    
  }
  
}