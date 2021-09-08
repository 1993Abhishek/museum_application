import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';

class Zone7Animals extends StatefulWidget {
  final Function onExpand;

  const Zone7Animals({Key key, this.onExpand}) : super(key: key);

  @override
  _Zone7AnimalsState createState() => _Zone7AnimalsState();
}

class _Zone7AnimalsState extends State<Zone7Animals> {
  List<String> animalImagesZone7 = [
    'assets/Lord Derby Eland.jpg',
    'assets/Mountain Nyala .jpg',
    'assets/Dwarf Forest Buffalo.jpeg',
    'assets/Saiga Antelope.jpg',
  ];
  List<String> animalNamesZone7 = [
    'Eland: Lord Derby Eland',
    'Nyala: Mountain Nyala',
    'Buffalo: Dwarf Forest\nBuffalo',
    'Gazelle: Saiga Gazelle',
  ];
  List<String> descriptionsZone7 = [
    'Giant Eland or Lord Derby Eland are the largest of the Antelope species. Found in the forested savannas of central Africa, they call parts of Nigeria, Cameroon, Congo, Central African Republic and the Sudan home. Living in groups up to 30 animals, they are naturally very alert and wary, making them difficult to get close to and often on the constant move. For a large animal, they can run up to 40mph to escape threats. They are part of the Spiral Horns of Africa.',
    'Mountain Nyala are one of the largest of the Spiral Horned antelope of Africa. A Nyala by species, they are referred to by the local Ethiopians as the “highland greater kudu,” living in dense forests of central Ethiopia at altitudes up to 13,000 feet. Very shy and elusive animals, they spend a lot of time in the dense forest away from any human pressure and are most active from dusk till dawn searching for food.',
    'Dwarf Forest Buffalo, also referred to as Dwarf Buffalo or the Congo Buffalo, are the smallest species of buffalo in Africa. Their horns do not sweep down, which is typical of other buffalo, but they sweep out and back. Their ears are also a unique characteristic as they have large tuffs of hair on the ends. They live in dense rainforests and in smaller groups than their cousins, the Cape Buffalo, with numbers ranging in the 30s. They are found in west African in different regions of Guinea, Sierra Leone, Ghana, and Nigeria. They’re also found in Central Africa in Central African Republic, Congo, Cameroon, Rio Muni, Gabon, and Angola.',
    'There are two main subspecies of Saiga Antelope. They are a unique looking antelope with large noses made to help filter the dust and debris from their nomadic lifestyle. In the winter it also warms the cold air before it’s breathed in. They are found in large herds traveling the grasslands on the footsteps of the mountains of Mongolia, Kazakhstan, Uzbekistan and regions of Russia. These animals are on the decline due mainly to poaching for their meat as well as their horns for traditional Asian medicine. Large conservation efforts are underway to help bring the Saiga antelope back to its large numbers and to continue to be nomadic icons.',
  ];
  List<String> scientificNames = [
    'Taurotragus debianus',
    'Tragelaphus buxtoni',
    'Syncerus caffer nanus',
    'Saiga tatarica',
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
                  'zoneName', 'Old Trophy Room: Zone 7',);
                widget.onExpand(7);
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

  List<String> audioPathsF = [
    'audio/Zone1.1-Leopard.mp3',
    'audio/Zone1.10-PatasMonkey.mp3',
    'audio/Zone1.2-GreaterKudu.mp3',
    'audio/Zone1.3-Sable.mp3',
    'audio/Zone1.4-UgandaCobb.mp3',
    'audio/Zone1.5%20-JacksonHeartBeast.mp3',
    'audio/Zone1.6-Gerenuk.mp3',
    'audio/Zone1.7-Korrigum.mp3',
    'audio/Zone1.8-WildDog.mp3',
    'audio/Zone1.9-Aardwolf.mp3',
    'audio/Zone2.1-Argali.mp3',
    'audio/Zone2.2-Urials.mp3',
    'audio/Zone2.3-NorthAmericanDesertBighorn.mp3',
    'audio/Zone2.4-Markhor.mp3',
    'audio/Zone2.5-Ibex.mp3',
    'audio/Zone2.6-Goats.mp3',
    'audio/Zone3.1-Bears(Polar).mp3',
    'audio/Zone4.1-Duiker.mp3',
    'audio/Zone4.2-DuikerAders.mp3',
    'audio/Zone4.3-RoyalAntelope.mp3',
    'audio/Zone4.4-Bongo.mp3',
    'audio/Zone4.5-WaterBuffalo.mp3',
    'audio/Zone4.6-GiantForestHog.mp3',
    'audio/Zone4.7-BrocketDeer.mp3',
    'audio/Zone5.1-MuskDeer.mp3',
    'audio/Zone5.2-Lynx.mp3',
    'audio/Zone5.3-CaperCaillie.mp3',
    'audio/Zone6.1-WoodBison.mp3',
    'audio/Zone6.2-Wolf.mp3',
    'audio/Zone6.3-Rhino.mp3',
    'audio/Zone7.1-Eland.mp3',
    'audio/Zone7.2-Nyala.mp3',
    'audio/Zone7.3-ForrestBuffalo.mp3',
    'audio/Zone7.4-Gazelle.mp3'
  ];

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
            "Old Trophy Room: Zone 7 (Total animals highlighted: 4)",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: hDimen(24),
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: hDimen(20),
                crossAxisSpacing: hDimen(10),
                crossAxisCount:
                    /*orientation == Orientation.portrait ? 2 :*/ 3,
                childAspectRatio: 0.9,
              ),
              itemBuilder: ((context, index) {
                return searchAnimalCard(
                  audioPath: audioPathsF[index + 30],
                  assetsPath: animalImagesZone7[index],
                  description: descriptionsZone7[index],
                  animalName: animalNamesZone7[index],
                  scientificName: scientificNames[index],
                );
              }),
              itemCount: descriptionsZone7.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
