import 'package:camp_finder/app/data/database/db.dart';
import 'package:camp_finder/app/ui/modules/camping_register/gallery_item_dialog.dart';
import 'package:camp_finder/app/ui/modules/camping_register/open_hours_dialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire2/geoflutterfire2.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CampingRegisterPage extends StatefulWidget {
  const CampingRegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CampingRegisterPage> createState() => _CampingRegisterPageState();
}

class _CampingRegisterPageState extends State<CampingRegisterPage> {
  List<Map<String, dynamic>> openHours = [];
  List<Map<String, dynamic>> gallery = [];
  List<Map<String, dynamic>> additionalInfo = [];

  void _addOpenHour() async {
    final result = await showDialog<Map<String, dynamic>>(
      context: context,
      builder: (context) => OpenHoursDialog(),
    );

    if (result != null) {
      setState(() {
        openHours.add(result);
      });
    }
  }

  void _addGalleryItem() async {
    final galleryItem = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) => GalleryItemDialog(),
    );
    if (galleryItem != null) {
      setState(() {
        gallery.add(galleryItem);
      });
    }
  }

  void validateAddInfo() {
    setState(() {
      if (additionalInfoItem.isNotEmpty) {
        additionalInfo.add({
          'type': 'Informações Adicionais',
          'info': additionalInfoItem,
        });
      }
      if (restaurants.isNotEmpty) {
        additionalInfo.add({
          'type': 'Restaurantes',
          'info': restaurants,
        });
      }
      if (otherServices.isNotEmpty) {
        additionalInfo.add({
          'type': 'Outros Serviços',
          'info': otherServices,
        });
      }
      if (taxes.isNotEmpty) {
        additionalInfo.add({
          'type': 'Taxas',
          'info': taxes,
        });
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  var phoneFormatter = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});
  var urlFormatter = MaskTextInputFormatter(
      mask: 'https://####################', filter: {"#": RegExp(r'[\w]')});
  // Aqui, vamos criar as variáveis para os dados que vamos coletar do usuário.
  String title = "";
  String nameCamping = "";
  String image = "";
  String about = "";
  String phone = "";
  String? type = 'C';
  String trekking = "";
  String services = "";
  String address = "";
  String website = "";
  String instagram = "";
  String whatsapp = "";
  double? latitude = 0.0;
  double? longitude = 0.0;

  String taxes = '';
  String additionalInfoItem = '';
  String restaurants = '';
  String otherServices = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Camping'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Título'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o título';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome do Camping'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome do camping';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      nameCamping = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Link da Imagem',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      image = value;
                    });
                  },
                ),
                TextFormField(
                  maxLength: 500,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Sobre',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      about = value;
                    });
                  },
                ),
                TextFormField(
                  inputFormatters: [phoneFormatter],
                  decoration: InputDecoration(
                    labelText: 'Telefone',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Tipo"),
                  value: type,
                  items: [
                    DropdownMenuItem(
                      child: Text("Camping"),
                      value: "C",
                    ),
                    DropdownMenuItem(
                      child: Text("Trilha"),
                      value: "T",
                    ),
                    DropdownMenuItem(
                      child: Text("Trekking"),
                      value: "TK",
                    ),
                    DropdownMenuItem(
                      child: Text("4x4"),
                      value: "4x4",
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      type = value;
                    });
                  },
                ),
                TextFormField(
                  maxLength: 500,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Trekking',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      trekking = value;
                    });
                  },
                ),
                TextFormField(
                  maxLength: 500,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Serviços',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      services = value;
                    });
                  },
                ),
                TextFormField(
                  maxLength: 300,
                  decoration: InputDecoration(
                    labelText: 'Endereço',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Site',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      website = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Instagram',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      instagram = value;
                    });
                  },
                ),

                TextFormField(
                  inputFormatters: [phoneFormatter],
                  decoration: InputDecoration(
                    labelText: 'Whatsapp',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira algum texto';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      whatsapp = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Latitude'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      latitude = double.tryParse(value);
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Longitude'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      longitude = double.tryParse(value);
                    });
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Mais Informações',
                  style: TextStyle(
                    fontSize: 20, // ou o tamanho desejado
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Taxas',
                  ),
                  onChanged: (value) {
                    setState(() {
                      taxes = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Informações Adicionais',
                  ),
                  onChanged: (value) {
                    setState(() {
                      additionalInfoItem = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Restaurantes',
                  ),
                  onChanged: (value) {
                    setState(() {
                      restaurants = value;
                    });
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Outros Serviços',
                  ),
                  onChanged: (value) {
                    setState(() {
                      otherServices = value;
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                ),

                // Aqui é onde estamos adicionando a exibição da lista de horários de abertura
                for (var openHour in openHours)
                  ListTile(
                    leading: Text('Horário'),
                    title: Text('${openHour['day']}: ${openHour['hours']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          openHours.remove(openHour);
                        });
                      },
                    ),
                  ),
                ElevatedButton(
                  child: Text('Adicionar Horário'),
                  onPressed: _addOpenHour,
                ),

                for (var galleryItem in gallery)
                  ListTile(
                    title:
                        Text('${galleryItem['type']}: ${galleryItem['url']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          gallery.remove(galleryItem);
                        });
                      },
                    ),
                  ),
                ElevatedButton(
                  child: Text('Adicionar à Galeria'),
                  onPressed: _addGalleryItem,
                ),

                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.check),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            int code = await getNextCode();
            GeoFirePoint geoFirePoint = GeoFlutterFire()
                .point(latitude: latitude!, longitude: longitude!);
            FirebaseFirestore firestore = FirebaseFirestore.instance;
            var campingDocument =
                await firestore.collection(DB.DB_CAMP_NAME).doc();
            DateTime now = DateTime.now();
            int timestamp = now.millisecondsSinceEpoch;
            campingDocument.set({
              'code': code,
              'title': title.toLowerCase(),
              'name_camping': nameCamping.toLowerCase(),
              'image': image,
              'about': about,
              'phone': phone,
              'type': type,
              'trekking': trekking,
              'services': services,
              'address': address,
              'website': website,
              'instagram': instagram,
              'whatsapp': whatsapp,
              'position': geoFirePoint.data,
              'update_date': timestamp,
            });
            openHours.forEach((openHour) async {
              await campingDocument.collection('open_hours').add(openHour);
            });
            gallery.forEach((galleryItem) async {
              await campingDocument.collection('gallery').add(galleryItem);
            });

            validateAddInfo();
            additionalInfo.forEach((info) async {
              await campingDocument.collection('additional_info').add(info);
            });
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}

Future<int> getNextCode() async {
  final counterRef =
      FirebaseFirestore.instance.collection('counters').doc(DB.DB_CAMP_NAME);
  final counterDoc = await counterRef.get();
  if (!counterDoc.exists) {
    // Se o documento do contador não existir, criamos com o valor inicial 1
    await counterRef.set({'count': 1});
    return 1;
  } else {
    // Se o documento do contador existir, incrementamos o valor do contador e retornamos
    int nextCode = counterDoc.get('count') + 1;
    await counterRef.update({'count': nextCode});
    return nextCode;
  }
}
