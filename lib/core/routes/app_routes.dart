import 'package:get/get.dart';
import 'package:theme_app/core/logic/bindings/initial_binding.dart';
import 'package:theme_app/core/views/home_view.dart';

abstract class Routes {
  static const HOME = Paths.home;
  // static const initial = Paths.initial;

  static final routes = [
    GetPage(
      name: Paths.home,
      page: () => HomeView(),
      binding: InitialBinding(),
    ),
  ];
}

abstract class Paths {
  static const home = '/home';
  // static const initial = '/initial';
}
