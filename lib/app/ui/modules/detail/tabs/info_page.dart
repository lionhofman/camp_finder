import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(
          title: Text('Taxas', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(
              'Adultos: \$20 por noite\nCrianças: \$10 por noite\nEstacionamento: \$5 por veículo'),
        ),
        Divider(),
        ListTile(
          title: Text('Informações Adicionais',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(
              'Check-in: 2pm\nCheck-out: 11am\nNão são permitidos animais'),
        ),
        Divider(),
        ListTile(
          title: Text('Restaurantes',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(
              'Restaurante 1: Aberto das 8h às 22h\nRestaurante 2: Aberto das 6h às 18h'),
        ),
        Divider(),
        ListTile(
          title: Text('Outros Serviços',
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(
              'Wi-Fi: Disponível na área da recepção\nLenha: \$5 por carga'),
        ),
      ],
    );
  }
}
