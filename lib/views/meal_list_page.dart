import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:meal/common_widgets/loading_ui.dart';
import 'package:meal/models/meals_category.dart';
import 'package:meal/providers/meal_provider.dart';
import 'package:meal/views/meal_detail_page.dart';

import '../common_widgets/connection_ui.dart';

class MealList extends StatelessWidget {
  MealsCategory mealsCategory;
  MealList(this.mealsCategory);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.grey[300],
                pinned: true,
                floating: true,
                expandedHeight: 200,
                toolbarHeight: 50,
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.all(10),
                    expandedTitleScale: 2,
                    title: Text(
                      mealsCategory.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                          letterSpacing: 2),
                    ),
                    background: InkWell(
                        child: Hero(
                            tag: mealsCategory.id,
                            child: Container(
                              margin: EdgeInsets.only(top: 8),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.saturation,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: mealsCategory.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )))),
              ),
            ];
          },
          body: _buildMealsList(),
        ),
      ),
    );
  }

  Consumer _buildMealsList() {
    return Consumer(builder: (context, ref, child) {
      final filterCategory = ref.watch(mealsCategoryProvider(mealsCategory.name));
      return filterCategory.when(
          data: (data) {
            return Container(
              color: Colors.grey[350],
              padding: EdgeInsets.symmetric(vertical: 6),
              child: GridView.builder(

                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 2,
                      childAspectRatio: 3 / 3.2
                  ),

                  physics: BouncingScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => MealDetailPage(data[index].id), transition: Transition.leftToRight);
                        },
                        child: Column(
                          children: [
                            Container(
                                height: 140.h,
                                child: Card(
                                    elevation: 3,
                                    color: Colors.grey[350],
                                    child: CachedNetworkImage(
                                      fit: BoxFit.fitHeight,
                                      imageUrl:data[index].image,
                                      placeholder: (context, url) => Center(child: LoadingUI()),
                                    ))),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(data[index].name, overflow: TextOverflow.ellipsis,),
                            ),

                          ],
                        ),
                      ),
                    );
                  }
              ),
            );
          },
          error: (err, stack) => (err as String).contains('No Internet.') ? ConnectionUI(() {ref.refresh(mealsCategoryProvider(mealsCategory.name ));}) : Center(child: Text(err.toString())),
          loading: () => Center(child: LoadingUI()));
    });
  }
}
