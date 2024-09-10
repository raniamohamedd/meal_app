// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/cat.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/screens/mealscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class item extends StatelessWidget {
  const item({
    Key? key,
    required this.category,
    required this.available,
  }) : super(key: key);
  final Category category;

  final List<Meal> available;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //GestureDetector
      onTap: () {
        final List<Meal> filter = available
            .where((Meal) => Meal.categories.contains(category.id))
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => Mealscreen(
                  title: category.title,
                  meal: filter,
                )));
      },

      borderRadius: BorderRadius.circular(1),
      splashColor: Theme.of(context).primaryColorLight,

      child: Card(
        elevation: 40,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.hardEdge,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              gradient: LinearGradient(colors: [
                category.color.withOpacity(.5),
                category.color.withOpacity(1)
              ])),
          child: Center(
              child: Text(
            category.title,
            style: GoogleFonts.dancingScript(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
