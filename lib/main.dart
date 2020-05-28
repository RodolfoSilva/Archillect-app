import 'package:archillect/ui/home_screen.dart';
import 'package:flutter/material.dart';

import 'context/imageSource.dart';

void main (){


 runApp(MaterialApp(
   home: HomeScreen(),
   theme: ThemeData(
     hintColor: Colors.white,
     primaryColor: Color.fromARGB(255, 21, 21, 21),
     inputDecorationTheme: InputDecorationTheme(
       enabledBorder:
       OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
       focusedBorder:
       OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
       hintStyle: TextStyle(color: Colors.amber),
     )
   ),
   debugShowCheckedModeBanner: false,
 ));
}