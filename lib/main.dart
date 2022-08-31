/*
 * @Author: renjie.yin
 * @Date: 2022-05-16 09:22:41
 * @LastEditors: renjie.yin
 * @LastEditTime: 2022-08-31 18:33:21
 * @Description: 
 */
import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:worker_manager/worker_manager.dart';
import 'package:yuedu_hd/ui/YDRouter.dart';
import 'package:yuedu_hd/ui/home_page.dart';
import 'package:yuedu_hd/ui/reading/page_reading.dart';
import 'package:yuedu_hd/ui/style/ycolors.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite/sqflite.dart';

import 'ui/style/ycolors.dart';

void main() async {
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  }
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([ 	 //强制横屏
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight
  // ]);
  // SystemChrome.setEnabledSystemUIOverlays([]);
  await Executor().warmUp(log: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      navigatorKey: YDRouter.mainRouter,
      title: '书探',
      theme: ThemeData(
        // This is the theme of your application.
        primaryColor: YColors.primary,
        primaryColorDark: YColors.primary_dark,
        primaryColorLight: YColors.primary_light,
        backgroundColor: YColors.background,
        cardColor: YColors.background_card,
        hintColor: YColors.text_hint,
        scaffoldBackgroundColor: YColors.background,
        canvasColor: YColors.background_input,
        accentColor: YColors.text_btn_color,
        colorScheme: ColorScheme.light(
          secondary: YColors.text_btn_color,
          primary: YColors.primary,
          background: YColors.background,
        ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        platform: TargetPlatform.iOS,
      ),
      routes: <String, WidgetBuilder>{
        YDRouter.READING_PAGE: (context) => PageReading(),
      },
      home: HomePage(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
