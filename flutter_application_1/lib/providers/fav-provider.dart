import 'package:flutter_application_1/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class favmealnotifier extends StateNotifier<List<Meal>> {
  favmealnotifier() : super([]);
  bool togglmealfav(Meal meal) {
    final isexist = state.contains(meal);

    if (isexist) {
      state = state.where((e) => e.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];

      return true;
    }
  }
}

final favmealprovider = StateNotifierProvider<favmealnotifier, List<Meal>>(
    (ref) => favmealnotifier());
