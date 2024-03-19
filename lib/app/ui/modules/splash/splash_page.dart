import 'package:camp_finder/app/ui/modules/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final SplashController controller = Get.find<SplashController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // Adicionado
      child: Directionality(
        // Adicionado
        textDirection: TextDirection
            .ltr, // Direcionalidade definida para esquerda para a direita (LTR)
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/png/camp_finder.png',
                    width: 150), // Seu logo
                SizedBox(height: 30),
                SpinKitChasingDots(
                    color: Colors.blue, size: 50.0), // Loader animado
              ],
            ),
          ),
        ),
      ),
    );
  }
}
