import 'package:camp_finder/app/core/img_cache/img_cache_custom.dart';
import 'package:camp_finder/app/ui/modules/home/model/model_services.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class TopServicesWidget extends StatelessWidget {
  const TopServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: getTopServiceList().length,
        itemBuilder: (BuildContext context, int index) {
          ModelServices data = getTopServiceList()[index];

          return InkWell(
            onTap: () {
              // ServiceDetail().launch(context);
            },
            child: Container(
              width: 120,
              margin: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(40),
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: boxDecorationRoundedWithShadow(40,
                          backgroundColor: context.cardColor),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: commonCacheImageWidget(data.img.validate(), 50,
                            width: 50, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    data.title.validate(),
                    style: primaryTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            splashColor:
                Colors.blue.withAlpha(30), // Personalize a cor do splash aqui
          );
        },
      ),
    );
  }
}
