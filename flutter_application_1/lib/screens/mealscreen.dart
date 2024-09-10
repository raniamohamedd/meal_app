import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/screens/mealdetails_screen.dart';
import 'package:flutter_application_1/widgets/meal-item.dart';
import 'package:google_fonts/google_fonts.dart';

class Mealscreen extends StatelessWidget {
  const Mealscreen({
    super.key,
    this.title,
    required this.meal,
  });
  final String? title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? Content(context)
        : Scaffold(
            appBar: AppBar(title: Text(title!,style: GoogleFonts.bebasNeue(fontSize: 30),)),
            body: Content(context),
          );
  }

  SingleChildScrollView Content(BuildContext context) {
    return SingleChildScrollView(
    padding: EdgeInsets.only(left: 19,right: 19),
        child: Column(
            children: meal
                .map(
                  (meal) => mealitem(
                    meal: meal,
                    onselected: (Meal meal) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => mealdetailscreen(
                                    meal: meal,
                                  )));
                    },
                  ),
                )
                .toList()));
  }
}
