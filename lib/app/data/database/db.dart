import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

class DB {
  DB._();
  static final DB _instance = DB._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static get() {
    return DB._instance._firestore;
  }

  static setupDemoData() async {
    FirebaseFirestore firestore = DB.get();
    final geo = GeoFlutterFire();

    List<GeoFirePoint> campings = [
      geo.point(
          latitude: -26.829722734562125, longitude: -49.14417502504178), //ok
      geo.point(
          latitude: -26.885833990711706, longitude: -26.885833990711706), //ok
      geo.point(
          latitude: -26.910896745948747, longitude: -49.08798352435655), //ok
      geo.point(
          latitude: -26.863173011321173, longitude: -49.07032093969818), //ok

      geo.point(
          latitude: -26.909051940015196, longitude: -49.08514483828157), //ok
      geo.point(
          latitude: -27.851651925191604, longitude: -49.284572999999995), //ok
      geo.point(
          latitude: -28.126442360715277, longitude: -49.40438102435655), //ok

      geo.point(latitude: -26.758347280824, longitude: -49.21321328835835), //ok

      geo.point(
          latitude: -26.743321599201753, longitude: -49.30562330425879), //ok

      geo.point(
          latitude: -26.682190770892667, longitude: -49.179925233824385), //ok

      geo.point(
          latitude: -27.00294639628824, longitude: -49.19322512699181), //ok
    ];
    final dados = [
      {
        'name': 'Camping Recanto do Vale',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipME0cK2sEjWm24dOpxngIt8ursNhz5vdD-l8V-a=w426-h240-k-no',
        'position': campings[0].data,
      },
      {
        'name': 'Camping Remanso-açu',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipNUwPKXhQHZhBDJatRlaJT7d2Nj7B8iS_diEbRR=w408-h306-k-no',
        'position': campings[1].data,
      },
      {
        'name': 'Camping Florestal',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipP7pI743huWwGuTibSIxDfxzDWRDAktochXzvb9=w426-h240-k-no',
        'position': campings[2].data,
      },
      {
        'name': 'Blu Camping',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipNNx1XHwPwCPul-k1BbKOeA3ysq-YkT7Nr9dyp1=w426-h240-k-no',
        'position': campings[3].data,
      },
      {
        'name': 'Camping Amigos Do Rafa',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipNESaJp5HP0ZuslnKcCOUOSxkUVf0DBwGiEEjUP=w426-h240-k-no',
        'position': campings[4].data,
      },
      {
        'name': 'Soldados Sebold',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipPRPmhimL2GDjyMHKMI3A9Mp0e6HrEgMz-RP3bV=w426-h240-k-no',
        'position': campings[5].data,
      },
      {
        'name': 'Camping do Mirante',
        'image':
            'https://trilhasemsc.com.br/public/img/camping/camping-mirante/detalhes-principal.jpg',
        'position': campings[6].data,
      },
      {
        'name': 'Camping morro azul',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipMHC8l_7YY5gMGUMCEfvsjRIayHJII8xsAdfnBK=w408-h306-k-no',
        'position': campings[7].data,
      },
      {
        'name': 'Camping do Morro São Bernardo',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipMWKU5lC2sWkfkv3M2QaqkOw5hfKwXNWBAbyOPQ=w408-h510-k-no',
        'position': campings[8].data,
      },
      {
        'name': 'Camping Pomerode',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipO8IjJ9lJ5D3bfoJOyCqxYJVJCpWFhvGurRHHv5=w408-h306-k-no',
        'position': campings[9].data,
      },
      {
        'name': 'Sítio Ruediger',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipNjBmgHynGBXjL9XS5yYS56Dwcu9flDqTEhTp-O=w408-h890-k-no',
        'position': campings[10].data,
      },
    ];

    await firestore.collection('camping').add(dados[0]);
    await firestore.collection('camping').add(dados[1]);
    await firestore.collection('camping').add(dados[2]);
    await firestore.collection('camping').add(dados[3]);
    await firestore.collection('camping').add(dados[4]);
    await firestore.collection('camping').add(dados[5]);
    await firestore.collection('camping').add(dados[6]);
    await firestore.collection('camping').add(dados[7]);
    await firestore.collection('camping').add(dados[8]);
    await firestore.collection('camping').add(dados[9]);
    await firestore.collection('camping').add(dados[10]);
  }
}
