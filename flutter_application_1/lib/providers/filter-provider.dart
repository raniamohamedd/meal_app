import 'package:flutter_riverpod/flutter_riverpod.dart';

enum fil { glutenfree, lacfree, vegfree, vegefree }

class filternotifier extends StateNotifier<Map<fil, bool>> {
  filternotifier()
      : super({
          fil.glutenfree: false,
          fil.lacfree: false,
          fil.vegefree: false,
          fil.vegfree: false
        });

  void setfilter(fil filtr, bool active) {
    state = {...state, filtr: active};
  }

  void setfilters(Map<fil, bool> chodrnf) {
    state = chodrnf;
  }
}

final filterprovider = StateNotifierProvider<filternotifier, Map<fil, bool>>(
    (ref) => filternotifier());
