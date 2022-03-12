// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/network/remote/bloc_observer.dart';
import 'package:news_app/network/remote/dio_helper.dart';

void main() {

  BlocOverrides.runZoned(
        () {
      //
    },
    blocObserver: MyBlocObserver(),
  );
DioHelper.init();
// CacheHelper.init();


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit ,NewsStates>(

        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state)
    {
        return  MaterialApp(
          theme: ThemeData(
           primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: Colors.white,
               appBarTheme: AppBarTheme(
             backwardsCompatibility: false,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
             statusBarIconBrightness: Brightness.dark,
             ),
             backgroundColor: Colors.white,
           elevation: 0.0,
          titleTextStyle: TextStyle(
          color: Colors.black,
         fontSize: 20,
           fontWeight: FontWeight.bold,
            ),
         iconTheme: IconThemeData(
          color: Colors.black
         )
         ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
         type: BottomNavigationBarType.fixed,
         selectedItemColor: Colors.deepOrange,
        elevation: 20,
         )
       ),
         darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black
            ),
             themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
         home: AnimatedSplashScreen(
             splash: Image.asset('assets/22.png',
             ),
               nextScreen: Directionality(
              textDirection: TextDirection.ltr,

               child: NewsLayOut()),
             splashTransition: SplashTransition.rotationTransition,
                backgroundColor: Colors.white,
                    splashIconSize: 200,

    )

    );
    },

      ),
    );
  }
}
