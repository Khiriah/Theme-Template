import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_app/core/logic/controllers/theme_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final controller = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Theme'),
        centerTitle: true,
      ),
      body: GetBuilder<ThemeController>(builder: (_) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: controller.animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: controller.animationController.value * 1 * pi,
                    child: child,
                  );
                },
                child: Icon(
                  controller.settingsGetStorageBox.read('isDarkMode')
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  size: 100,
                ),
              ),
              SizedBox(
                height: 50,
                child: Center(
                  child: AnimatedDefaultTextStyle(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 500),
                      style: GoogleFonts.ubuntuMono(
                        fontSize: controller.fontSize,
                        color: controller.textColor,
                        fontWeight: FontWeight.w900,
                      ),
                      child: Text(controller.currentModeName.value)),
                ),
              ),
              Text(
                'Current theme',
                style: Theme.of(context).textTheme.headline4,
              ),
              SelectableText(
                'Flutter Theme',
                style: Theme.of(context).textTheme.overline,
              ),
              const SizedBox(height: 2),
              const Icon(
                Icons.ac_unit,
                size: 30,
              ),
              const SizedBox(height: 20),
              CupertinoSwitch(
                value: controller.settingsGetStorageBox.read('isDarkMode'),
                onChanged: (bool val) {
                  controller.toggleTheme();
                  Get.snackbar(
                    '',
                    '',
                    maxWidth: 300,
                    titleText: Text(
                      'App Theme Changed',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    messageText: Text(
                      'to ${controller.currentModeName.value.toUpperCase()}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    snackStyle: SnackStyle.FLOATING,
                    // maxWidth: 150,
                    mainButton: TextButton(
                      style:
                          TextButton.styleFrom(foregroundColor: Colors.black),
                      onPressed: () {
                        controller.changeAppTheme();
                        Get.back();
                      },
                      child: Text(
                        'Revert',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                    backgroundColor:
                        controller.isDarkTheme ? Colors.white : Colors.black,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              const SizedBox(height: 2),
              ElevatedButton(
                  onPressed: () {
                    controller.changeAppTheme();
                    if (Get.isOverlaysOpen) {
                      Get.back();
                    }
                    Get.snackbar(
                      '',
                      '',
                      maxWidth: 300,
                      titleText: Text(
                        'App Theme Changed',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      messageText: Text(
                        'to ${controller.currentModeName.value.toUpperCase()}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      snackStyle: SnackStyle.FLOATING,
                      // maxWidth: 150,
                      mainButton: TextButton(
                        style:
                            TextButton.styleFrom(foregroundColor: Colors.black),
                        onPressed: () {
                          controller.changeAppTheme();
                          Get.back();
                        },
                        child: Text(
                          'Revert',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                      backgroundColor:
                          controller.isDarkTheme ? Colors.white : Colors.black,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  child: const Text('Change Theme')),
              const SizedBox(height: 5),
            ],
          ),
        );
      }),
    );
  }
}
