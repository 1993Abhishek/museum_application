import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'dart:convert';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';

class Zone3Animals extends StatefulWidget {
  final Function onExpand;
  const Zone3Animals({Key key,this.onExpand}) : super(key: key);

  @override
  _Zone3AnimalsState createState() => _Zone3AnimalsState();
}

class _Zone3AnimalsState extends State<Zone3Animals> {
  List<String> animalImagesZone3 = [
    'assets/Polar Bear.jpg'
  ];
  List<String> animalNamesZone3 = [
   'Bears: Polar Bear'
  ];
  List<String> descriptionsZone3 = [
    'Polar Bears are the largest land predators in the world and can weigh over 1,300 pounds. Polar bears or white bears are found in the arctic of North America, as well as Eurasia. Adapted to life on the ice as well as the mainland, they are a top predator wherever they are found. These bears have adapted to life in the artic very well: they have black skin to absorb the sun, wide feet to help walk on snow as well as swim, and 3 eyelids to help protect their eyes from the elements.  Their closest relative is the Alaskan Brown Bear.',
   ];
  List<String> scientificNames = [
'Ursus maritimus',
  ];
  @override
  void initState() {
    // _load();
    // _initAudios();
    super.initState();
  }

  Widget exploreButton() {
    return Container(
      height: hDimen(40),
      width: hDimen(100),
      decoration: BoxDecoration(
        color: AppColor.colorPrimary,
        borderRadius: BorderRadius.circular(hDimen(20)),
        border: Border.all(
          color: Colors.grey[400],
          width: 0.0,
        ),
      ),
      child: Center(
        child: Text(
          "EXPLORE",
          style: TextStyle(
            fontSize: hDimen(15),
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget searchAnimalCard({
    String animalName,
    String description,
    String assetsPath,
    String audioPath,
    String scientificName,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          hDimen(20),
        ),
      ),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.only(left: hDimen(10), right: hDimen(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            vSpacing(hDimen(10)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  animalName,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(20),
                  ),
                ),
                Container(
                  height: hDimen(60),
                  width: hDimen(60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(hDimen(10)),
                    child: Image.asset(
                      assetsPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            vSpacing(hDimen(20)),
            Expanded(
              child: Text(
                shortDescription(
                  description: description,
                ),
                style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: hDimen(18),
                ),
              ),
            ),
            vSpacing(hDimen(20)),
            GestureDetector(
              child: exploreButton(),
              onTap: () {
                print('Hello');
                SharedPreference.saveStringPreference(
                  'description',
                  description,
                );
                SharedPreference.saveStringPreference(
                  'name',
                  animalName,
                );
                SharedPreference.saveStringPreference(
                  'imgPath',
                  assetsPath,
                );
                SharedPreference.saveStringPreference(
                  'audioPath',
                  audioPath,
                );
                SharedPreference.saveStringPreference(
                    'scientificName', scientificName,);
                SharedPreference.saveStringPreference(
                  'zoneName',
                  'Cave: Zone 3',
                );
                widget.onExpand(3);
              },
            ),
            vSpacing(hDimen(20)),
          ],
        ),
      ),
    );
  }

  String shortDescription({String description}) {
    String shortDesc = description.substring(0, 250) + '...';
    return shortDesc;
  }

  List<String> audioPathsF=['audio/Zone1.1-Leopard.mp3', 'audio/Zone1.10-PatasMonkey.mp3', 'audio/Zone1.2-GreaterKudu.mp3', 'audio/Zone1.3-Sable.mp3', 'audio/Zone1.4-UgandaCobb.mp3', 'audio/Zone1.5%20-JacksonHeartBeast.mp3', 'audio/Zone1.6-Gerenuk.mp3', 'audio/Zone1.7-Korrigum.mp3', 'audio/Zone1.8-WildDog.mp3', 'audio/Zone1.9-Aardwolf.mp3', 'audio/Zone2.1-Argali.mp3', 'audio/Zone2.2-Urials.mp3', 'audio/Zone2.3-NorthAmericanDesertBighorn.mp3', 'audio/Zone2.4-Markhor.mp3', 'audio/Zone2.5-Ibex.mp3', 'audio/Zone2.6-Goats.mp3', 'audio/Zone3.1-Bears(Polar).mp3', 'audio/Zone4.1-Duiker.mp3', 'audio/Zone4.2-DuikerAders.mp3', 'audio/Zone4.3-RoyalAntelope.mp3', 'audio/Zone4.4-Bongo.mp3', 'audio/Zone4.5-WaterBuffalo.mp3', 'audio/Zone4.6-GiantForestHog.mp3', 'audio/Zone4.7-BrocketDeer.mp3', 'audio/Zone5.1-MuskDeer.mp3', 'audio/Zone5.2-Lynx.mp3', 'audio/Zone5.3-CaperCaillie.mp3', 'audio/Zone6.1-WoodBison.mp3', 'audio/Zone6.2-Wolf.mp3', 'audio/Zone6.3-Rhino.mp3', 'audio/Zone7.1-Eland.mp3', 'audio/Zone7.2-Nyala.mp3', 'audio/Zone7.3-ForrestBuffalo.mp3', 'audio/Zone7.4-Gazelle.mp3'];



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: hDimen(30),
        right: hDimen(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpacing(hDimen(20)),
          Text(
            "Cave: Zone 3 (Total animals highlighted: 1)",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: hDimen(24),
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child:  GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: hDimen(20),
                crossAxisSpacing: hDimen(10),
                crossAxisCount:
                /*orientation == Orientation.portrait ? 2 :*/ 3,
                childAspectRatio: 0.9,
              ),
              itemBuilder: ((context, index) {
                return searchAnimalCard(
                  scientificName: scientificNames[index],
                  audioPath: audioPathsF[index+16],
                  assetsPath: animalImagesZone3[index],
                  description: descriptionsZone3[index],
                  animalName: animalNamesZone3[index],
                );
              }),
              itemCount: descriptionsZone3.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
