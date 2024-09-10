// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/providers/fav-provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class mealdetailscreen extends ConsumerWidget {
  const mealdetailscreen({
    Key? key,
    required this.meal,
  }) : super(key: key);
  final Meal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fav = ref.watch(favmealprovider);
    final bool isfav = fav.contains(meal);

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title, style: GoogleFonts.bebasNeue(fontSize: 30)),
        actions: [
          IconButton(
              onPressed: () {
                final wasadded =
                    ref.read(favmealprovider.notifier).togglmealfav(meal);

                ScaffoldMessenger.of(context).removeCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.grey,
                    content: Text(wasadded
                        ? 'added to favourites'
                        : 'removed from favourites')));
              },
              icon: AnimatedSwitcher(
                duration: Duration(seconds: 1),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                      turns:
                          Tween<double>(begin: .8, end: 1).animate(animation),
                      child: child);
                },
                child: Icon(
                  isfav ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  key: ValueKey(isfav),
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19, top: 20, bottom: 19),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Text('ingredients',
                            style: GoogleFonts.bebasNeue(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (final ing in meal.ingredients)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(ing,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.abel(
                                  color: Colors.black, fontSize: 17)),
                        ],
                      ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Text('steps',
                        style: GoogleFonts.bebasNeue(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final step in meal.steps)
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [ Text(step,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.abel(
                                color: Colors.black, fontSize: 17)),],)
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
