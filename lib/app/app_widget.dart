import 'package:camp_finder/app/app_binding.dart';
import 'package:camp_finder/app/ui/app_pages.dart';
import 'package:camp_finder/app/ui/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // The two lines bellow are for the responsive
      title: "Camp Finder",
      initialRoute: AppRoutes.SPLASH,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.openSans().fontFamily,
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
