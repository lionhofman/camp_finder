// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:camp_finder/app/domain/entities/additional_info.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  final List<AdditionalInfo>? listAdditioinalInfo;

  const InfoPage({
    Key? key,
    this.listAdditioinalInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Get.height,
        child: ListView.builder(
          itemCount:
              listAdditioinalInfo != null ? listAdditioinalInfo!.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return Visibility(
              visible: listAdditioinalInfo![index].type != null &&
                  listAdditioinalInfo![index].type!.isNotEmpty,
              child: Column(
                children: [
                  ListTile(
                    title: Text(listAdditioinalInfo![index].type ?? "",
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(listAdditioinalInfo![index].info ?? ""),
                  ),
                  const Divider(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
