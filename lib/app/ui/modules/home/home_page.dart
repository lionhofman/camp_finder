import 'package:camp_finder/app/ui/global_widgets/app_bar_header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarHeader(),
      body: Container(),
    );
  }
}
