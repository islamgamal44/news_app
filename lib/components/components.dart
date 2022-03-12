
// ignore_for_file: prefer_const_constructors, avoid_print, body_might_complete_normally_nullable, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/moduels/webview/webview_screen.dart';


Widget defaultButton ({
 required double width,
  required Color background ,
  required Function function ,
  required String text ,

}) =>  Container(
  width:double.infinity,
   height: 40,
child: MaterialButton(
  height: 40,
  onPressed: (){},
child: Text(
  text,
style: TextStyle(
color: Colors.white

),
),
),
  decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(10)

  ),

);




Widget defaultTextFormField({
  required TextEditingController controller ,
  required TextInputType type ,
  required  Function(String ? val ) validate ,
  required String label ,
  required IconData prefix,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  Function? suffixPressed,
  IconData ? suffix,
  bool isPassword = true ,
  bool isClickable = true ,


}) =>   TextFormField(
  controller:  controller,
  keyboardType: type,
  enabled:isClickable ,
  onFieldSubmitted: (s)
  {
    onSubmit!(s);
  },
  onChanged: (s)
  {
   onChange!(s);
  },
  onTap: (){
    onTap!();
  },

  validator: (String ? value)
  {
   return validate(value);
  },
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix != null ? IconButton(
        onPressed: (){
          suffixPressed!();
        },
        icon: Icon(suffix),
    ):null ,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10)

    ),

  ),

);

Widget buildTaskItem(Map model ,context) => Dismissible(

  key: Key(model['id'].toString()),
  child:Padding(

    padding: const EdgeInsets.all(20),

    child: Row(

      children: [

        CircleAvatar(

          radius: 40,

          child: Text(

              '${model['time']}'

          ),

        ),

        SizedBox(

          width: 20,

        ),

        Expanded(



          child: Column(

            children: [

              Text(

          '${model['title']}',

                style: TextStyle(

                    fontSize: 18,

                    fontWeight: FontWeight.bold

                ),

              ),

              Text(

                  '${model['date']}',

                style: TextStyle(

                    color: Colors.grey

                ),

              ),

            ],

          ),

        ),

        SizedBox(

          width: 20,

        ),

       IconButton(

           onPressed: ()

           {




           },

           icon: Icon(Icons.check_box,

             color: Colors.green,

           )

       ),

       IconButton(

           onPressed: ()

           {






           },

           icon: Icon(Icons.archive,

             color: Colors.black12,

           )

       ),

      ],

    ),

  ),
  onDismissed: (direction)
  {

  },
);

Widget tasksBuilder ({

  required List<Map> tasks ,
}) => ConditionalBuilder(


condition: tasks.isNotEmpty,
builder: (BuildContext context) => ListView.separated(
itemBuilder: (context, index) => buildTaskItem(tasks[index] ,context) ,
separatorBuilder: (context, index) => Padding(
padding: const EdgeInsetsDirectional.only(
start: 20
),
child: Container(
width: double.infinity,
height: 1,
color: Colors.grey[300],
),
),
itemCount: tasks.length
),
fallback: (BuildContext context) => Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(
Icons.menu,
size: 100,
color: Colors.grey,
),
Text(
'No tasks yet , please add some tasks ',
style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 16,
color: Colors.grey,

),
)
],
),
),
);

Widget muDivider() =>  Padding(
  padding: const EdgeInsetsDirectional.only(
      start: 20
  ),
  child: Container(
    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
);

Widget  buildArticleItem(article ,context) =>  InkWell(
  onTap: ()
  {
    navigateTo(
        context,
        WebViewScreen(article['url'])
    );
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120,

          height: 120,

          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                  image: NetworkImage(

                    '${article['urlToImage']}',



                  ),

                  fit: BoxFit.cover

              )

          ),

        ),

        SizedBox(

          width: 20,

        ),

        Expanded(



          child: Container(

            height: 120,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(



                  child: Text(

                    '${article['title']}',

                    style: TextStyle(

                        fontSize: 18,

                        fontWeight: FontWeight.w600

                    ),

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,



                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: TextStyle(

                    color: Colors.grey,

                  ),



                ),

              ],

            ),

          ),

        )

      ],

    ),

  ),
);

Widget articleBuilder(list ) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context)  => ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildArticleItem(list[index] , context ),
      separatorBuilder: (context, index) => muDivider(),
      itemCount: 10
  ),
  fallback: (context)  => Center(child: CircularProgressIndicator()),
);


void navigateTo (context , widget ) => Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget,
    ),
);