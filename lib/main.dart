

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal/views/home_page.dart';

import 'constants.dart';

void main (){
  runApp(MaterialApp(debugShowCheckedModeBanner:false, home: ProviderScope(child: MyApp())));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.grey[300]
  ));
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    deviceheight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    devicewidth = MediaQuery.of(context).size.width;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[300],
            textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
        ),
        home: HomePage()
    );
  }
}
