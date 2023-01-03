import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:theme_app/core/logic/bindings/initial_binding.dart';
import 'package:theme_app/core/logic/controllers/theme_controller.dart';
import 'package:theme_app/core/routes/app_routes.dart';
import 'package:theme_app/core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Initialize GetStorage

  // Creating theme instance For Getting the ThemeMode Stage from the ThemeController
  final ThemeController themeController = Get.put(ThemeController());
  GetStorage().read<bool>('isDarkMode') == null
      ? themeController.settingsGetStorageBox.write("isDarkMode", false)
      : themeController.settingsGetStorageBox.read("isDarkMode");

  runApp(MyApp(
    themeController: themeController,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeController themeController;
  const MyApp({Key? key, required this.themeController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Flutter Theme",
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.HOME,
      getPages: Routes.routes,
      initialBinding:
          InitialBinding(), // Initial Binding to make Sure the ThemeController is initialized
      themeMode: themeController
          .themeStateFromGetStorageSettingBox, // Setting the ThemeMode from the GetStorage Setting Box
      theme: CustomTheme.lightTheme, // CustomThemeData for Light Theme
      darkTheme: CustomTheme.darkTheme, // CustomThemeData for Dark Theme
    );
  }
}
