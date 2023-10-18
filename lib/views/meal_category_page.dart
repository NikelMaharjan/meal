

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:meal/common_widgets/connection_ui.dart';
import 'package:meal/common_widgets/loading_ui.dart';
import 'package:meal/providers/meal_provider.dart';
import 'package:meal/views/meal_list_page.dart';
import 'package:meal/views/search_page.dart';



class MealCategoryPage extends StatelessWidget {


  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.grey[300],
            title: Text("Categories", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),),
            actions: [
              IconButton(onPressed: (){
                 Get.to(() => SearchPage(), transition: Transition.leftToRight);
               }, icon: Icon(Icons.search, color: Colors.black,))
            ],

          ),
          body: Consumer(
              builder: (context, ref, child) {
                
                final data = ref.watch(mealCategoryProvider);

                if(data.isLoad){
                  return Center(
                    child: LoadingUI(),
                  );
                }

                else if (data.errMsg.isEmpty){
                  return GridView.builder(


                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1.9,
                          crossAxisSpacing: 6,
                          childAspectRatio: 3 / 3.2
                      ),

                      physics: BouncingScrollPhysics(),
                      itemCount: data.mealCategory.length,
                      itemBuilder: (context, index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Get.to(() => MealList(data.mealCategory[index]), transition: Transition.leftToRight);
                            },
                            child: Column(
                              children: [
                                Container(
                                    height: 154.h,
                                    child: Card(
                                        elevation: 2,
                                        color: Colors.grey[350],
                                        child: Hero(
                                          tag: data.mealCategory[index].id,
                                          child: CachedNetworkImage(
                                            imageUrl:data.mealCategory[index].image,
                                            placeholder: (context, url) => Center(child: LoadingUI()),
                                            fit: BoxFit.fitWidth,),
                                        ))),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(data.mealCategory[index].name),
                                ),

                              ],
                            ),
                          ),
                        );
                      }
                  );

                }

                else{
                  return Center(
                    child: Text(data.errMsg),
                  );
                }


























              }
          )
      ),
    );
  }
}
