import 'package:get/get.dart';
import 'package:theme_app/app/logic/bindings/initial_binding.dart';
import 'package:theme_app/app/views/home_view.dart';





abstract class Routes {

  static const HOME = _Paths.HOME;
  // static const INITIAL = _Paths.INITIAL;

 static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () =>  HomeView(),
      binding: InitialBinding(),
    ),
  ];
}


abstract class _Paths {

  static const HOME = '/home';
  // static const INITIAL = '/initial';
}
