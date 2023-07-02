import 'package:flutter/material.dart';

class GalleryItemDialog extends StatefulWidget {
  const GalleryItemDialog({super.key});

  @override
  State<GalleryItemDialog> createState() => _GalleryItemDialogState();
}

class _GalleryItemDialogState extends State<GalleryItemDialog> {
  String? type;
  String? url;

  final urlInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            value: type,
            items: [
              'photo',
              'video',
            ].map((type) {
              return DropdownMenuItem<String>(
                value: type,
                child: Text(type),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                type = value;
              });
            },
            hint: Text('Escolha o tipo (photo/video)'),
          ),
          TextFormField(
            controller: urlInputController,
            decoration: InputDecoration(
              hintText: 'Insira a URL',
              prefixText: 'https://',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor insira a URL';
              }
              return null;
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: Text('Cancelar'),
          onPressed: Navigator.of(context).pop,
        ),
        TextButton(
          child: Text('Adicionar'),
          onPressed: () {
            if (type != null && urlInputController.text.isNotEmpty) {
              Navigator.of(context).pop({
                'type': type!,
                'url': 'https://' + urlInputController.text,
              });
            } else {
              print('Type and URL must be provided');
            }
          },
        ),
      ],
    );
  }
}
