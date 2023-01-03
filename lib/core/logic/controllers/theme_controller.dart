import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late bool isDarkTheme = false;
  late bool themeGetStorageSetting = false;

  // GetStorage for storing the theme setting
  final settingsGetStorageBox = GetStorage();

  //! Not Related To Theme> Just for Animation
  late Color textColor;
  double fontSize = 20;
  late AnimationController animationController;
  //! <Not Related To Theme Just for Animation

  Rx<String> currentModeName = ''.obs;

  @override
  void onInit() {
    //Getting theme Stage from ThemeController when homeView initialized
    //! Not Related To Theme > Just for Animation
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 430));
    animationController.reset();
    //! <Not Related To Theme Just for Animation
    super.onInit();
  }

  //! Getting Theme Stage From GetStorage and Set it to the ThemeMode this will be used in main.dart file

  ThemeMode get themeStateFromGetStorageSettingBox =>
      getThemeFromGetStorageBox() ? ThemeMode.dark : ThemeMode.light;

  // private Method to Get GetStorage  theme Setting value adn Return it
  bool getThemeFromGetStorageBox() {
    themeGetStorageSetting = settingsGetStorageBox.read('isDarkMode') ?? false;
    currentModeName.value = themeGetStorageSetting ? 'Dark' : 'Light';
    textColor = themeGetStorageSetting ? Colors.white : Colors.red;
    fontSize = themeGetStorageSetting ? 30 : 20;
    return themeGetStorageSetting;
  }

  // private Method to update GetStorage  theme Setting value
  void _updateGetStorageThemeSetting(bool boolData) {
    settingsGetStorageBox.write('isDarkMode', boolData);
  }

  // Method to change the Theme State when the user call it via Theme Change Button
  void changeTheme({
    required bool isDarkMode,
    required Rx<String> modeName,
  }) {
    if (Get.isDarkMode) {
      modeName.value = 'Light';
      isDarkMode = false;
      isDarkTheme = false;
      _updateGetStorageThemeSetting(false);
      _changeThemeMode(ThemeMode.light);
    } else {
      modeName.value = 'Dark';
      isDarkMode = true;
      isDarkTheme = true;
      _updateGetStorageThemeSetting(true);
      _changeThemeMode(ThemeMode.dark);
    }
  }

  //Private Method to change theme
  void _changeThemeMode(ThemeMode themeMode) => Get.changeThemeMode(themeMode);

  // Change Theme  Method That will call From HomeView
  void changeAppTheme() => _changeTheme();

  // Toggling the Theme
  bool toggleTheme() {
    _changeTheme();
    return isDarkTheme;
  }

  // Changing Value for Animation
  void _animate() {
    if (isDarkTheme) {
      fontSize = 30;
      textColor = Colors.white;
      animationController.reverse();
    } else {
      fontSize = 20;
      textColor = Colors.red;
      animationController.forward();
    }
  }

  // Calling the changeTheme Method from ThemeController
  void _changeTheme() {
    changeTheme(
      isDarkMode: isDarkTheme,
      modeName: currentModeName,
    );
    _animate();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
