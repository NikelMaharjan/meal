

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:meal/common_widgets/connection_ui.dart';
import 'package:meal/common_widgets/loading_ui.dart';
import 'package:meal/constants.dart';
import 'package:meal/providers/meals_provider.dart';
import 'package:meal/views/meal_list.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Consumer(
              builder: (context, ref, child) {
                final allCategory = ref.watch(mealsAllCategoryProvider);
                final randomMeal = ref.watch(randomMealProvider);

                return Column(
                  children: [
                    // InkWell(
                    //   splashColor: Colors.grey,
                    //   onTap: (){
                    //     ref.refresh(randomMealProvider);},
                    //   child: Container(
                    //       margin: EdgeInsets.only(top: 2),
                    //       height: deviceheight * 0.05,
                    //       child: Text.rich(
                    //         TextSpan(
                    //           children: [
                    //             TextSpan(text: "Random Meal", style: TextStyle(fontSize: 24, letterSpacing: 4)),
                    //             WidgetSpan(child: Icon(CupertinoIcons.refresh)),
                    //           ],
                    //         ),
                    //       )
                    //   ),
                    // ),
                    // Container(
                    //   height: deviceheight *0.2 ,
                    //   child: randomMeal.when(
                    //     data: (data){
                    //       return InkWell(
                    //         onTap: () => Get.to(() => MealDetailPage(data[0]), transition: Transition.leftToRight),
                    //         child: CachedNetworkImage(
                    //           height: deviceheight *0.2,
                    //           width: double.infinity,
                    //           imageUrl: data[0].image,
                    //           fit: BoxFit.cover,
                    //           placeholder: (context, url) => Center(child: LoadingUI()),),
                    //       );
                    //
                    //     },
                    //     error: (err, stack) => (err as String).contains('No Internet.') ? ConnectionUI(() {ref.refresh(randomMealProvider);}) : Center(child: Text(err.toString())),
                    //     loading: () => Center(child: LoadingUI()),
                    //   ),
                    //
                    //
                    //
                    // ),
                    Container(
                        height: deviceheight *0.06,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Categories", style: TextStyle(fontSize: 24),),
                        )),

                    allCategory.when(
                        data: (data){
                          return Expanded(
                            child: GridView.builder(

                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 8,
                                    crossAxisSpacing: 6,
                                    childAspectRatio: 3 / 3.28
                                ),

                                physics: BouncingScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index){
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => MealList(data[index]), transition: Transition.leftToRight);
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                              height: deviceheight * 0.2,
                                              child: Card(
                                                elevation: 2,
                                                  color: Colors.grey[350],
                                                  child: Hero(
                                                    tag: data[index].id,
                                                    child: CachedNetworkImage(
                                                      imageUrl:data[index].image,
                                                      placeholder: (context, url) => Center(child: LoadingUI()),
                                                      fit: BoxFit.fitWidth,),
                                                  ))),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 8.0),
                                            child: Text(data[index].name),
                                          ),

                                        ],
                                      ),
                                    ),
                                  );
                                }
                            ),
                          );

                        },
                        error: (err, stack) => Center(child: (err as String).contains('No Internet.') ? ConnectionUI(() {ref.refresh(mealsAllCategoryProvider);}): Text('$err'),),
                        loading: () => Expanded(child: Center(child: LoadingUI()))
                    )


                  ],
                );

              }
          ),
        )
    );
  }
}
