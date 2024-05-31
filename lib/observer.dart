import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Observer extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    if (kDebugMode) {
      print("Create :: $bloc");
    }
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    if (kDebugMode) {
      print("Close :: $bloc");
    }
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    if (kDebugMode) {
      print(change);
    }
    super.onChange(bloc, change);
  }
}
