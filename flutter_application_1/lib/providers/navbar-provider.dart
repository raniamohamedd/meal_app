import 'package:flutter_riverpod/flutter_riverpod.dart';

class navbarprovider extends StateNotifier<int> {
  navbarprovider() : super(0);

  void setpage(int index) {
    state = index;
  }
}

final navprovider =
    StateNotifierProvider<navbarprovider, int>((_) => navbarprovider());
