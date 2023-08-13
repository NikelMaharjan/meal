

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/views/meal_category_page.dart';


void main (){
  runApp(MaterialApp(debugShowCheckedModeBanner:false, home: ProviderScope(child: MyApp())));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[300],
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark
  ));
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {



    return ScreenUtilInit(
      designSize: const Size(414, 861),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child){
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.grey[300],
                textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
            ),
            home: MealCategoryPage()


        );
      },
    );
  }
}
