import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';

class Zone2Animals extends StatefulWidget {
  final Function onExpand;

  const Zone2Animals({
    Key key,
    this.onExpand,
  }) : super(key: key);

  @override
  _Zone2AnimalsState createState() => _Zone2AnimalsState();
}

class _Zone2AnimalsState extends State<Zone2Animals> {
  List<String> animalImagesZone2 = [
    'assets/Hanguy Argali .jpg',
    'assets/Konya Sheep.jpg',
    'assets/Desert Bighorn.jpg',
    'assets/Kashmir Markhor .jpg',
    'assets/Mid-Asian Ibex.jpg',
    'assets/Himalayan Tahr .jpg',
  ];
  List<String> animalNamesZone2 = [
    'Argali: Hanguy Argali',
    'Urials / Mouflon:\nKonya Sheep',
    'North American:\nTexas Bighorn',
    'Markhor',
    'Ibex: Mid-Asian',
    'Goats: Himalayan Tahr',
  ];
  List<String> descriptionsZone2 = [
    'Argali are the largest of the wild sheep species in the world, with the largest argali subspecies found in Mongolia. The word Argali is the Mongol word meaning Wild Sheep. These sheep live in elevations ranging from 1,000 – 19,000 feet. Their horns can weigh as much as 50 pounds and reach over 60 inches in length.  Argali are also the largest bodied of the ovis family: they can be 200 pounds and can live up to 13 years old.',
    'Urials have 9 different direct subspecies and are closely related the Mouflon family.  Some scientists say they should all be classified in one genus. These sheep are the smallest subspecies of ovis living throughout Asia, mostly in the arid countries of Pakistan, Iran, Afghanistan, Uzbekistan, and Tajikistan. Large rams would top the scales at 110 pounds. These sheep can live up to 13,000 feet in elevation.',
    'There are 4 main species of sheep that make up the North American Grand Slam: Desert Bighorn, Rocky Mountain Bighorn, Dall Sheep and Stone Sheep. There are different subspecies of Desert Bighorn that range from the southern United States through Mexico. The Texas Bighorn, or Nelson Bighorn, is found in pockets of west and south Texas. There is a large conservation effort to help bring these iconic sheep back to their home range. Throughout the US, many conservation organizations are helping introduce and manage bighorns in their home ranges: from the west through the Midwest. A large ram’s horns will weigh up to thirty pounds.',
    'There are 5 main subspecies of Markhor that are found in Tajikistan, Afghanistan, Pakistan, and India, living upwards of 12,000 feet.  Markhor are all in the genus Capra subspecies Capriae. There is a large conservation effort in their home ranges to emphasize the importance of these animals with the local people and governments. Without conservation these animals are poached because it is said their horns have healing properties.',
    'there are 16 huntable species of Ibex from Europe to Asia. The Mid-Asian Ibex from Tajikistan is the largest subspecies that can have horns over 45 inches and weigh 300 pounds. The smallest subspecies is native to Greece and tips the scales at 100 pounds.',
    'One of the most iconic of the Capra species, Tahr is known for its big mane that gets long and dense in the winter extending from its neck through its shoulders. These animals can be found in their native range Nepal, as well as in their introduced home of New Zealand. The New Zealand Tahr is a self-sustaining wild population. They can be found living upwards of 16,000 feet.'
  ];
  List<String> scientificNames = [
    'ovis ammon',
    'Ovis orientalis anatolica',
    'Ovis canadensis nelson',
    'Capra falconeri',
    'Capra sibirca',
    'Hemitragus jemlahicus',
  ];

  @override
  void initState() {
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
    return GestureDetector(
      onTap: (){
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
          'scientificName',
          scientificName,
        );
        SharedPreference.saveStringPreference(
          'zoneName',
          'Mountain: Zone 2',
        );

        widget.onExpand(2);
      },
      child: Card(
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
              Container(
                height: hDimen(200),
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(hDimen(10)),
                  child: Image.asset(
                    assetsPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              vSpacing(hDimen(10)),
              Expanded(
                child: Text(
                  animalName,
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: hDimen(20),
                  ),
                ),
              ),
              vSpacing(hDimen(10)),
              // Expanded(
              //   child: Text(
              //     shortDescription(
              //       description: description,
              //     ),
              //     style: TextStyle(
              //       color: Colors.black,
              //       // fontWeight: FontWeight.bold,
              //       fontSize: hDimen(18),
              //     ),
              //   ),
              // ),
              // vSpacing(hDimen(20)),
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
                    'scientificName',
                    scientificName,
                  );
                  SharedPreference.saveStringPreference(
                    'zoneName',
                    'Mountain: Zone 2',
                  );

                  widget.onExpand(2);
                },
              ),
              vSpacing(hDimen(20)),
            ],
          ),
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
            "Mountain: Zone 2 (Total animals highlighted: 6)",
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
                childAspectRatio: 0.6,
              ),
              itemBuilder: ((context, index) {
                return searchAnimalCard(
                  scientificName: scientificNames[index],
                  audioPath: audioPathsF[index + 10],
                  assetsPath: animalImagesZone2[index],
                  description: descriptionsZone2[index],
                  animalName: animalNamesZone2[index],
                );
              }),
              itemCount: descriptionsZone2.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
