import 'package:flutter/material.dart';

class OpenHoursDialog extends StatefulWidget {
  const OpenHoursDialog({super.key});

  @override
  State<OpenHoursDialog> createState() => _OpenHoursDialogState();
}

class _OpenHoursDialogState extends State<OpenHoursDialog> {
  String? day;
  String? startTime;
  String? endTime;

  final List<String> timeSlots = List<String>.generate(24, (int index) {
    final time = (index < 10 ? '0' : '') + index.toString() + ':00';
    return time;
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            hint: Text('Dia da semena'),
            value: day,
            items: [
              'Segunda-feira',
              'Terça-feira',
              'Quarta-feira',
              'Quinta-feira',
              'Sexta-feira',
              'Sabado',
              'Domingo',
            ].map((day) {
              return DropdownMenuItem<String>(
                value: day,
                child: Text(day),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                day = value;
              });
            },
          ),
          DropdownButton<String>(
            value: startTime,
            items: timeSlots.map((time) {
              return DropdownMenuItem<String>(
                value: time,
                child: Text(time),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                startTime = value;
              });
            },
            hint: Text('Selecione a hora de abertura'),
          ),
          DropdownButton<String>(
            value: endTime,
            items: timeSlots.map((time) {
              return DropdownMenuItem<String>(
                value: time,
                child: Text(time),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                endTime = value;
              });
            },
            hint: Text('Selecione a hora de fechamento'),
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
            Navigator.of(context).pop({
              'day': day,
              'hours': '$startTime - $endTime',
            });
          },
        ),
      ],
    );
  }
}
