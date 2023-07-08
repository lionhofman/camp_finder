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
          Text("Insira uma URL de Video ou de Foto"),
          TextFormField(
            controller: urlInputController,
            decoration: InputDecoration(
              hintText: 'https:// ',
              // prefixText: 'https://',
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
            if (urlInputController.text.isNotEmpty) {
              String url = 'https://' + urlInputController.text;
              String type = url.contains('youtube') ? 'video' : 'photo';
              Navigator.of(context).pop({
                'type': type,
                'url': url,
              });
            } else {
              print('URL must be provided');
            }
          },
        ),
      ],
    );
  }
}
