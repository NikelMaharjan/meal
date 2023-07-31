
import 'meals.dart';

class SearchState {


  final List<Meals> meals;
  final bool isLoad;
  final String errMsg;
  final String searchText;


  SearchState ({required this.meals, required this.isLoad, required this.errMsg, required this.searchText});



  SearchState.initState() : meals = [], isLoad = false, errMsg = '', searchText = '';


  SearchState copyWith({List<Meals>? meals, bool? isLoad, String? errMsg, String? searchText}){

    return SearchState(
        meals: meals ?? this.meals,
        isLoad: isLoad ?? this.isLoad,
        errMsg: errMsg ?? this.errMsg,
        searchText: searchText ?? this.searchText,
    );


  }





}