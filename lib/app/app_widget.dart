import 'package:camp_finder/app/app_binding.dart';
import 'package:camp_finder/app/ui/app_pages.dart';
import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // The two lines bellow are for the responsive
      title: "Flutter's Clothings",
      initialRoute: AppRoutes.HOME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      getPages: AppPages.pages,
      defaultTransition: Transition.noTransition,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      locale: const Locale('pt', 'BR'),
      initialBinding: ApplicationBinding(),
    );
  }
}
