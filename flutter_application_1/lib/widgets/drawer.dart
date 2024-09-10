import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
class maindraw extends StatelessWidget {
  const maindraw({
    Key? key,
    required this.onselectscreen,
  }) : super(key: key);

  final void Function(String id) onselectscreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(.8)
            ])),
            child: Row(
              children: [ SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.fastfood,
                  
                  size: 50,
                  color: Color.fromARGB(138, 101, 3, 121),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Cooking up !',
                 style:GoogleFonts.chewy(    

 fontSize: 25,
            color: Color.fromARGB(138, 101, 3, 121),
        



              
               )  )
              ],
            )),
        ListTile(
          onTap: () {
            onselectscreen('meals');
          },
          leading: Icon(
            Icons.restaurant,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            'meals',
           style: GoogleFonts.chewy(
            fontSize: 25,
            color: Color.fromARGB(138, 101, 3, 121),
          //  fontWeight: FontWeight.bold,
          ),)
        ),
        ListTile(
          onTap: () {
            onselectscreen('filters');
          },
          leading: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          title: Text(
            'filters',
            style:GoogleFonts.chewy(    

 fontSize: 25,
            color: Color.fromARGB(138, 101, 3, 121),
        



              
               )
        ))],
    ));
  }
}
