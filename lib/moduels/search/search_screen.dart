// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/components/components.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';

class SearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (BuildContext context, Object? state) {  },

      builder: (BuildContext context, state)
      {

        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField
                  (controller: searchController,
                    type: TextInputType.text,
                    onChange: (value)
                    {
                     NewsCubit.get(context).getSearch(value);
                    },
                    validate: (String ?value)
                    {
                      if(value!.isEmpty)
                      {
                        return 'Search engine must not be empty ';
                      }
                      return null ;
                    },
                    label: 'Search',
                    prefix: Icons.search
                ),
              ),
              Expanded(

                child: articleBuilder(
                    list
                ),
              )
            ],
          ),
        );
      },

    );
  }
}
