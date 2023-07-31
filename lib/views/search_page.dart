


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:meal/models/searchState.dart';
import 'package:meal/providers/meal_provider.dart';
import 'package:meal/providers/search_provider.dart';
import 'package:meal/services/meal_services.dart';
import 'package:meal/views/meal_detail_page.dart';

import '../common_widgets/loading_ui.dart';
import 'meal_list_page.dart';

class SearchPage extends ConsumerWidget {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {

    final data = ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey, //change your color here
          ),
        backgroundColor: Colors.grey[300],
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextFormField(
                autofocus: true,
                controller: searchController,
                onFieldSubmitted: (val){
                  ref.read(searchProvider.notifier).getSearchData(searchText: val);
                },
                decoration: InputDecoration(


                    prefixIcon: const Icon(Icons.search, color: Colors.grey,),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey,),
                      onPressed: () {
                        searchController.clear();

                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          )),

       body: showSearhedResults(data),

    );
  }

  Widget showSearhedResults(SearchState data) {
    if(data.isLoad){
      return Center(
        child: LoadingUI(),
      );
    }

    else if(data.errMsg.isEmpty){

      return GridView.builder(

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 6,
              childAspectRatio: 3 / 3.28
          ),

          physics: BouncingScrollPhysics(),
          itemCount: data.meals.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  
                  Get.to(() => MealDetailPage(data.meals[index].idMeal));


                },
                child: Column(
                  children: [
                    Container(
                        height: 140.h,
                        child: Card(
                            elevation: 2,
                            color: Colors.grey[350],
                            child: CachedNetworkImage(
                              imageUrl:data.meals[index].image,
                              placeholder: (context, url) => Center(child: LoadingUI()),
                              fit: BoxFit.fitWidth,))),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(data.meals[index].name, overflow: TextOverflow.ellipsis,),
                    ),

                  ],
                ),
              ),
            );
          }
      );
    }

    else{

     return Center(child: Text(data.errMsg),);


    }
  }
}
