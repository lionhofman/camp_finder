import 'package:camp_finder/app/ui/global_widgets/app_bar_header.dart';
import 'package:flutter/material.dart';

class CampingTipsPage extends StatelessWidget {
  const CampingTipsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarHeader.simpleHeader(title: 'Dicas > Camping'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            tip0,
            extraTopic(),
            tip1,
            tip2,
            tip3,
            tip4,
            tip5,
            tip6,
          ],
        ),
      ),
    );
  }
}

Widget buildTip(String title, List<TextSpan> contents) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16.0),
    child: Card(
      elevation: 2.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 8.0),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[800],
                ),
                children: contents,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget extraTopic() {
  return Container(
    margin: const EdgeInsets.all(16.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, 2),
          blurRadius: 6.0,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Camping Wild vs. Camping Estruturado",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Wild Camping: ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              TextSpan(
                text:
                    "Este é o tipo de camping onde você acampa em uma área que não é um local de camping designado. É importante lembrar que, embora o wild camping possa proporcionar uma experiência mais autêntica e próxima da natureza, ele também vem com responsabilidades adicionais, como garantir que você não deixe lixo e respeite a fauna e a flora locais.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.0),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "Camping Estruturado: ",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              TextSpan(
                text:
                    "Camping estruturado ou camping em um local de camping designado geralmente oferece mais comodidades, como banheiros, chuveiros, áreas de cozinha e, às vezes, até eletricidade. Eles também costumam ser mais seguros e são uma ótima opção para famílias ou para aqueles que são novos no camping.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

var tip0 = buildTip(
  "O que é camping",
  [
    TextSpan(text: 'Camping é uma atividade '),
    TextSpan(
        text: 'ao ar livre', style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(
        text:
            ', que envolve passar noites em uma barraca, RV ou até mesmo ao ar livre. A experiência de acampar pode variar desde instalações de luxo até a sobrevivência na selva.'),
  ],
);

var tip1 = buildTip(
  "1. Pesquisa do local de camping",
  [
    TextSpan(text: 'Ao decidir entre '),
    TextSpan(
        text: 'camping wild', style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(text: ' ou '),
    TextSpan(
        text: 'estruturado', style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(text: ', considere os seguintes pontos: \n\n'),
    TextSpan(
        text:
            '- Verifique as condições climáticas e a presença de animais selvagens. \n'),
    TextSpan(
        text:
            '- Para camping wild, entenda as políticas de "não deixar rastro" e os possíveis perigos naturais. \n'),
    TextSpan(
        text:
            '- Em camping estruturado, veja as comodidades oferecidas e se é necessário fazer reservas. \n'),
    TextSpan(
        text:
            '- Em ambos os casos, esteja ciente das regras e regulamentos locais. \n\n'),
    TextSpan(
        text:
            'Lembre-se, a preparação é a chave para uma experiência de camping bem-sucedida e agradável.'),
  ],
);

var tip2 = buildTip(
  "2. Checklist de equipamentos",
  [
    TextSpan(text: 'Crie uma '),
    TextSpan(
        text: 'lista de equipamentos',
        style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(
        text:
            ' que você precisará para a sua viagem de camping. Isso geralmente inclui uma barraca, saco de dormir, kit de primeiros socorros, comida, água, roupas adequadas, utensílios de cozinha e um mapa ou GPS.'),
  ],
);

var tip3 = buildTip(
  "3. Preparação para o clima",
  [
    TextSpan(text: 'O '),
    TextSpan(text: 'clima', style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(
        text:
            ' pode mudar rapidamente quando você está acampando, então esteja preparado para todas as condições. Verifique a previsão do tempo antes de partir e certifique-se de levar equipamentos adequados para o clima.'),
  ],
);

var tip4 = buildTip(
  "4. Armazenamento de alimentos",
  [
    TextSpan(text: 'Armazene e manuseie '),
    TextSpan(text: 'alimentos', style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(
        text:
            ' de forma segura. Mantenha os alimentos frios em um cooler, separe os alimentos crus dos cozidos para evitar a contaminação cruzada e cozinhe os alimentos a uma temperatura segura.'),
  ],
);

var tip5 = buildTip(
  "5. Respeito ao local de camping",
  [
    TextSpan(text: 'Lembre-se sempre da regra do camping: '),
    TextSpan(
        text: 'deixe o local melhor do que quando você chegou',
        style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(
        text:
            '. Evite perturbar a vida selvagem, não deixe lixo e respeite as regras do local.'),
  ],
);

var tip6 = buildTip(
  "6. Aproveite a experiência",
  [
    TextSpan(text: 'Acima de tudo, certifique-se de '),
    TextSpan(
        text: 'se divertir e aproveitar',
        style: TextStyle(fontWeight: FontWeight.bold)),
    TextSpan(text: ' a experiência única que o camping oferece.'),
  ],
);
