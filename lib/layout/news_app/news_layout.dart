// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/moduels/search/search_screen.dart';

class NewsLayOut extends StatelessWidget {
  const NewsLayOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit ,NewsStates>(

      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state)
      {
        var cubit = NewsCubit.get(context);

       return  Scaffold(
          appBar: AppBar(
            title: Text(
                'News Layout'
            ),
            actions: [
              IconButton(
                  onPressed: ()
                  {
                    navigateTo(
                        context,
                        SearchScreen()
                    );
                  },
                  icon: Icon(Icons.search)
              ),
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.brightness_4_outlined)
              ),
            ],
          ),

          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            items:  cubit.bottomItems ,
            onTap: (index)
            {
              cubit.changeBottomNavBar(index);
            },

          ),
        );
      },

    );
  }
}
