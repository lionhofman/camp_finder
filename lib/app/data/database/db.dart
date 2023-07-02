import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';

class DB {
  DB._();
  static final DB _instance = DB._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String DB_CAMP_NAME = 'camps';
  static const String DB_USER_NAME = 'users';
  static get() {
    return DB._instance._firestore;
  }

  static setupDemoData() async {
    FirebaseFirestore firestore = DB.get();
    final geo = GeoFlutterFire();

    DateTime now = DateTime.now();
    int timestamp = now.millisecondsSinceEpoch;

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
    var openHours = [
      {'day': 'Segunda-feira', 'hours': '08:00 - 18:00'},
      {'day': 'Terça-feira', 'hours': '08:00 - 18:00'},
      {'day': 'Quarta-feira', 'hours': '08:00 - 18:00'},
    ];

    var gallery = [
      {
        'type': 'photo',
        'url':
            'https://lh5.googleusercontent.com/p/AF1QipP7pI743huWwGuTibSIxDfxzDWRDAktochXzvb9=w426-h240-k-no',
      },
      {
        'type': 'video',
        'url': 'v5mrdehPOEE',
      },
    ];

    var additionalInfo = [
      {
        'type': 'taxes',
        'info':
            'Adultos: \$20 por noite\nCrianças: \$10 por noite\nEstacionamento: \$5 por veículo',
      },
      {
        'type': 'additional_info',
        'info': 'Check-in: 2pm\nCheck-out: 11am\nNão são permitidos animais',
      },
      {
        'type': 'restaurants',
        'info':
            'Restaurante 1: Aberto das 8h às 22h\nRestaurante 2: Aberto das 6h às 18h',
      },
      {
        'type': 'other_services',
        'info': 'Wi-Fi: Disponível na área da recepção\nLenha: \$5 por carga',
      },
    ];
    final dados = [
      {
        'code': 1,
        'title': 'vale do itajai',
        'name_camping': 'Camping Recanto do Vale',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipME0cK2sEjWm24dOpxngIt8ursNhz5vdD-l8V-a=w426-h240-k-no',
        'position': campings[0].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 2,
        'title': 'vale do itajai',
        'name_camping': 'Camping Remanso-açu',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipNUwPKXhQHZhBDJatRlaJT7d2Nj7B8iS_diEbRR=w408-h306-k-no',
        'position': campings[1].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 3,
        'title': 'vale do itajai',
        'name_camping': 'Camping Florestal',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipP7pI743huWwGuTibSIxDfxzDWRDAktochXzvb9=w426-h240-k-no',
        'position': campings[2].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 4,
        'title': 'vale do itajai',
        'name_camping': 'Blu Camping',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipNNx1XHwPwCPul-k1BbKOeA3ysq-YkT7Nr9dyp1=w426-h240-k-no',
        'position': campings[3].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 5,
        'title': 'vale do itajai',
        'name_camping': 'Camping Amigos Do Rafa',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipNESaJp5HP0ZuslnKcCOUOSxkUVf0DBwGiEEjUP=w426-h240-k-no',
        'position': campings[4].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 6,
        'title': 'vale do itajai',
        'name_camping': 'Soldados Sebold',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipPRPmhimL2GDjyMHKMI3A9Mp0e6HrEgMz-RP3bV=w426-h240-k-no',
        'position': campings[5].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 7,
        'title': 'vale do itajai',
        'name_camping': 'Camping do Mirante',
        'image':
            'https://trilhasemsc.com.br/public/img/camping/camping-mirante/detalhes-principal.jpg',
        'position': campings[6].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 8,
        'title': 'vale do itajai',
        'name_camping': 'Camping morro azul',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipMHC8l_7YY5gMGUMCEfvsjRIayHJII8xsAdfnBK=w408-h306-k-no',
        'position': campings[7].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 9,
        'title': 'vale do itajai',
        'name_camping': 'Camping do Morro São Bernardo',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipMWKU5lC2sWkfkv3M2QaqkOw5hfKwXNWBAbyOPQ=w408-h510-k-no',
        'position': campings[8].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 10,
        'title': 'vale do itajai',
        'name_camping': 'Camping Pomerode',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipO8IjJ9lJ5D3bfoJOyCqxYJVJCpWFhvGurRHHv5=w408-h306-k-no',
        'position': campings[9].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
      {
        'code': 11,
        'title': 'vale do itajai',
        'name_camping': 'Sítio Ruediger',
        'image':
            'https://lh5.googleusercontent.com/p/AF1QipNjBmgHynGBXjL9XS5yYS56Dwcu9flDqTEhTp-O=w408-h890-k-no',
        'position': campings[10].data,
        'about':
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur",
        'phone': "47999145278",
        'type': 'C',
        'trekking':
            "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from ", //(Texto que explica primeiro, se tem trekking, distancia, nivel e etc)
        'services':
            "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of",
        'address': "Adresss information",
        'website': "http://www.google.com",
        'instagram': "@instagram_teste",
        'whatsapp': "479883254545",
        'update_date': timestamp,
      },
    ];

    /**Teste */
    // var campingDocument = await firestore.collection('camp_teste').doc();
    // campingDocument.set(dados[0]);
    // // await firestore.collection('camps').add(dados[0]);
    // openHours.forEach((openHour) async {
    //   await campingDocument.collection('open_hours').add(openHour);
    // });
    // gallery.forEach((galleryItem) async {
    //   await campingDocument.collection('gallery').add(galleryItem);
    // });
    // campingDocument = await firestore.collection('camp_teste').doc();
    // campingDocument.set(dados[1]);
    // // await firestore.collection('camps').add(dados[0]);
    // openHours.forEach((openHour) async {
    //   await campingDocument.collection('open_hours').add(openHour);
    // });
    // gallery.forEach((galleryItem) async {
    //   await campingDocument.collection('gallery').add(galleryItem);
    // });
    // additionalInfo.forEach((info) async {
    //   await campingDocument.collection('additional_info').add(info);
    // });
    /** Fim Teste */
    // await firestore.collection('camp_teste').add(dados[1]);
    // await firestore.collection('camp_teste').add(dados[2]);
    // await firestore.collection('camp_teste').add(dados[3]);
    // await firestore.collection('camp_teste').add(dados[4]);
    // await firestore.collection('camp_teste').add(dados[5]);
    // await firestore.collection('camp_teste').add(dados[6]);
    // await firestore.collection('camp_teste').add(dados[7]);
    // await firestore.collection('camp_teste').add(dados[8]);
    // await firestore.collection('camp_teste').add(dados[9]);
    // await firestore.collection('camp_teste').add(dados[10]);
  }
}
