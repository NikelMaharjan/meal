import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:meal/common_widgets/connection_ui.dart';
import 'package:meal/common_widgets/loading_ui.dart';
import 'package:meal/models/meals_category.dart';
import 'package:meal/providers/meal_provider.dart';
import 'package:meal/views/video_page.dart';

class MealDetailPage extends StatelessWidget {
  String mealID;
  MealDetailPage(this.mealID);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Consumer(builder: (context, ref, child) {
          final meal = ref.watch(mealProvider(mealID));
          return meal.when(
              data: (data) {
                final meals = data[0];    //we do this since meal details will return single array (check api)
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: meals.image,
                        height: 180.h,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 18,right: 10,left: 10),
                          child: Text(meals.name, style: TextStyle(fontWeight: FontWeight.bold),)),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                        child: Wrap(children: [
                          _buildIngredient(meals.strIngredient1),
                          _buildIngredient(meals.strIngredient2),
                          _buildIngredient(meals.strIngredient3),
                          _buildIngredient(meals.strIngredient4),
                          _buildIngredient(meals.strIngredient5),
                          _buildIngredient(meals.strIngredient6),
                          _buildIngredient(meals.strIngredient7),
                          _buildIngredient(meals.strIngredient8),
                          _buildIngredient(meals.strIngredient9),
                          _buildIngredient(meals.strIngredient10),
                          _buildIngredient(meals.strIngredient11),
                          _buildIngredient(meals.strIngredient12),
                          _buildIngredient(meals.strIngredient13),
                          _buildIngredient(meals.strIngredient14),
                          _buildIngredient(meals.strIngredient15),
                          _buildIngredient(meals.strIngredient16),
                          _buildIngredient(meals.strIngredient17),

                        ],),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Instructions", style: TextStyle(fontWeight: FontWeight.bold),),
                                Icon(CupertinoIcons.down_arrow)
                              ],
                            ),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                        color: Colors.black
                                    )
                                ),
                                onPressed: (){
                                  Get.to(() => VideoPage(data[0]), transition: Transition.leftToRight);
                                }, child: Row(
                              children: [
                                  Text("Video", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                                  Icon(CupertinoIcons.right_chevron, color: Colors.black,)
                              ],
                            )),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                            color: Colors.grey[350],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                meals.instructions,
                              ),
                            )),
                      ),
                    ],
                  ),
                );

              },
              error: (err, stack) => (err as String).contains('No Internet.') ? ConnectionUI( () { ref.refresh(mealProvider(mealID));}) : Center(child: Text('$err'),),
              loading: () => Center(child: LoadingUI()));
        }),
      ),
    );
  }



  Widget _buildIngredient(String label) {

    if(label.isEmpty ){
      return Container();
    }
    else {
      return Card(
          color: Colors.grey[350],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(label),
          ));
    }
  }
}
