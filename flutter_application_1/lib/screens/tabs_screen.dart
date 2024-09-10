import 'package:flutter_application_1/providers/fav-provider.dart';
import 'package:flutter_application_1/providers/filter-provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_application_1/providers/meals-provider.dart';
import 'package:flutter_application_1/providers/navbar-provider.dart';
import 'package:flutter_application_1/screens/categoryscreen.dart';
import 'package:flutter_application_1/screens/filter_screen.dart';
import 'package:flutter_application_1/screens/mealscreen.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final meals = ref.watch(mealprovider);
    final activefilter = ref.watch(filterprovider);

    final available = meals.where((meal) {
      if (activefilter[fil.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefilter[fil.lacfree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilter[fil.vegefree]! && !meal.isVegan) {
        return false;
      }
      if (activefilter[fil.vegfree]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activepage = categoryscreen(available: available);
    var activepagetitle = 'Category';
    final selectpindex = ref.watch(navprovider);
    if (selectpindex == 1) {
      final List<Meal> favmeal = ref.watch(favmealprovider);
      activepage = Mealscreen(
        meal: favmeal,
      );
      activepagetitle = 'favorite';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(43, 146, 174, 216),
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          activepagetitle,
          style: GoogleFonts.chewy(
            fontSize: 45,
            color: Color.fromARGB(88, 135, 15, 139),
          //  fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: activepage,
      drawer: maindraw(onselectscreen: (String id) {
        Navigator.of(context).pop();

        if (id == 'filters') {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => filters()));
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 10,
        selectedFontSize: 15,
        onTap: ref.read(navprovider.notifier).setpage,
        currentIndex: selectpindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'favorites')
        ],
      ),
    );
  }
}
