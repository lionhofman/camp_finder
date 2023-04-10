import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'MAPS_API_KEY')
  static const mapsApiKey = _Env.mapsApiKey;

  @EnviedField(varName: 'FIREBASE_ANDROID_KEY')
  static const firebaseAndroidKey = _Env.firebaseAndroidKey;

  @EnviedField(varName: 'FIREBASE_IOS_KEY')
  static const firebaseIOSKey = _Env.firebaseIOSKey;
}
