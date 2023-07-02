import 'package:flutter_riverpod/flutter_riverpod.dart';

final intlProvider = StateNotifierProvider<Internationalization, bool>(
    (ref) => Internationalization());

class Internationalization extends StateNotifier<bool> {
  Internationalization() : super(false);

  void toggleLang() {
    state = !state;
  }
}
