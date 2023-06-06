import 'package:camp_finder/app/core/constants/colors.dart';

import 'package:camp_finder/app/domain/entities/camping.dart';
import 'package:flutter/material.dart';

import 'package:nb_utils/nb_utils.dart';

class AboutUs extends StatefulWidget {
  final Camping campDetails;
  const AboutUs({Key? key, required this.campDetails}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(thickness: 1, color: Colors.grey),
              const Text('About Us',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                widget.campDetails.about,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),
              const Text('Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                widget.campDetails.address,
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              const SizedBox(height: 10),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.directions, color: appColorPrimary),
                label: const Text(
                  'Get Directions - 0.2 KM',
                  style: TextStyle(color: appColorPrimary),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: const AssetImage('assets/images/ls_Map.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4), BlendMode.darken),
                  ),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Show Map',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              const Text('Opening Hours',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              for (var day in ['Monday', 'Tuesday', 'Friday'])
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.black54),
                  title: Text(
                    '$day: 08:00 AM - 08:00 PM',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: appColorPrimary,
        child: const Icon(Icons.favorite_border),
      ),
    );
  }
}
