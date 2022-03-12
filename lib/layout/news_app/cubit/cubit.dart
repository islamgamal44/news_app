// ignore_for_file: prefer_const_constructors, avoid_print, prefer_is_empty, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/moduels/news/business/business_screen.dart';
import 'package:news_app/moduels/news/science/science_screen.dart';
import 'package:news_app/moduels/news/settings/settings_screen.dart';
import 'package:news_app/moduels/news/sports/sports_screen.dart';
import 'package:news_app/network/remote/dio_helper.dart';

class NewsCubit extends Cubit <NewsStates>
{
  NewsCubit() : super (NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex =0;
  List<BottomNavigationBarItem> bottomItems =
  [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
      label:  ' business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
      label:  ' Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
      label:  ' science'
    ),
  ];

  List<Widget> screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index)
  {
    currentIndex = index ;
    if(index ==1) {
      getSports();
    }
    if(index ==2) {
      getScience();
    }
    emit(NewsBottomNavState());

  }

  List<dynamic> business =[];
  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'us',
          'category':'business',
          'apiKey':'624eb3f22edd4706b37f7668e9f97ac1',

        }
    ).then((value) {
      // print(value.data.toString())

      business =value.data['articles'];

      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports =[];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length ==0  )
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'us',
              'category':'sports',
              'apiKey':'624eb3f22edd4706b37f7668e9f97ac1',

            }
        ).then((value) {
          // print(value.data.toString())

          sports =value.data['articles'];

          print(sports[0]['title']);
          emit(NewsGetSportsSuccessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetSportsErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGetSportsSuccessState());
        }

  }

  List<dynamic> science =[];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(sports.length ==0  )
      {

        DioHelper.getData(
            url: 'v2/top-headlines',
            query: {
              'country':'us',
              'category':'science',
              'apiKey':'624eb3f22edd4706b37f7668e9f97ac1',

            }
        ).then((value) {
          // print(value.data.toString())

          science =value.data['articles'];

          print(science[0]['title']);
          emit(NewsGetScienceSuccessState());
        }).catchError((error)
        {
          print(error.toString());
          emit(NewsGetScienceErrorState(error.toString()));
        });
      }else
        {
          emit(NewsGetScienceSuccessState());
        }


  }

  List<dynamic> search =[];
  void getSearch(String value )
  {

   emit(NewsGetSearchLoadingState());
   search = [];
   DioHelper.getData(
       url: 'v2/everything',
       query: {

         'q':'$value',
         'apiKey':'624eb3f22edd4706b37f7668e9f97ac1',

       }
   )
       .then((value) {
     // print(value.data.toString())

     search =value.data['articles'];

     print(search[0]['title']);
     emit(NewsGetSearchSuccessState());
   }).catchError((error)
   {
     print(error.toString());
     emit(NewsGetSearchErrorState(error.toString()));
   });
  }

}