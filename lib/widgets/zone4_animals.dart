import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'dart:convert';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';

class Zone4Animals extends StatefulWidget {
  final Function onExpand;
  const Zone4Animals({Key key,this.onExpand}) : super(key: key);

  @override
  _Zone4AnimalsState createState() => _Zone4AnimalsState();
}

class _Zone4AnimalsState extends State<Zone4Animals> {
  List<String> animalImagesZone4 = [
    'assets/Zebra Duiker.jpg',
    'assets/Aders Duiker.jpg',
    'assets/Royal Antelope .jpg',
    'assets/Bongo.jpg',
    'assets/Nile Buffalo.jpg',
    'assets/Giant Forest Hog.jpg',
    'assets/Brocket Deer.jpg'
  ];
  List<String> animalNamesZone4 = [
    'Duiker: Zebra Duiker',
    'Duiker: Aders',
    'Royal Antelope',
    'Bongo',
    'Nile Buffalo',
    'Giant Forest Hog',
    'Brocket Deer',
  ];
  List<String> descriptionsZone4 = [
    'The Zebra Duiker has many different names depending on where you find them: Zebra Duiker, Zebra Antelope, Banded Duiker, Striped Duiker, Marked Deer or Mountain Deer. They live in the dense rainforests of Sierra Leone, Libera and the Southwest Ivory Coast. Like their name suggests, they have very distinguishable striped markings ranging from 12-16 stripes. They are very wary animals that are rarely seen with diurnal habits.',
    'Once thought to be a subspecies of the Harvey’s Duiker or the Peters Duiker, Aders are now considered to be their own species. Native to coastal forests on the coast of Kenya, they also have a strong population in Zanzibar. Aders have notable white markings on their legs and lower body.  These duikers are very secretive and alert, making them extremely elusive and rarely seen with diurnal habits.',
    'Royal Antelope are the smallest antelope in the world. Weighing in at 4-6 pounds and 10 inches at the shoulder, and living in dense forests, these animals are extremely alert and wary.  Their size and habitat, paired with their mostly nocturnal tendencies, make them very rarely seen. Found from Guinea to Gana, they have developed several names with the locals, including King of Hares, which led to their name the Royal Antelope, as well as Tricky-Jack and Jackrabbit.',
    'The Bongo is one of the larger species in the Spiral Horn family, second to the Eland and Kudu. Bongo have an auburn or chestnut color with 10 to 15 stripes, allowing them to blend into the dense forest well. With a good sense of hearing and a nervous temperament, Bongo are wary animals and are difficult to find. The Eastern Bongo are found in regions in the Central African Republic and the Congo, and the Western Bongo are found mainly in the forests of Sierra Leone.',
    'Nile buffalo are cousins to the well-known Cape Buffalo. A distinct characteristic that separates the two is how the Nile Buffalo’s horns do not dip below the skull line. Native to parts of the Sudan, Ethiopia, Congo and Uganda, these buffalo are herd animals and can be aggressive when provoked.',
    'Giant Forest Hogs or Forest Hogs are the largest swine in the world. With large, pronounced heads, characteristically loud grunting, growling and squealing, and giant warty growths under their eyes, they live in lowland marshes to as high as 13,000 feet in dense forests. They are primarily nocturnal, but in places with limited pressure they can be increasingly diurnal. Living in small groups of 4-15, they are found in regions of Nigeria, Cameroon, Gabon, Central African Republic, Congo, Sudan, Uganda, Ethiopia, Kenya and Tanzania.',
    'There are three main species of Brocket Deer, with several subspecies of each: the Red, Grey-Brown and the Yucatan Grey-Brown Brocket Deer. These deer live in savannas, forest edges and rainforests, with some of the subspecies also living in Central and South America, the Yucatan peninsula and the island of Trinidad. Primarily nocturnal and shy, it is difficult to find all species of Brocket Deer.',
  ];
  List<String> scientificNames = [
    'Cephalophus zebra',
    'Cephalophus adersi',
    'Neotragus pygmaeus',
    'Tragelphus euycerus',
    'Synverus caffer aequicocialis',
    'Hylocherus meinertzageni',
    'Mazama americana',
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
    return GestureDetector(
      onTap: (){
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
          'Jungle: Zone 4',
        );
        widget.onExpand(4);
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
              vSpacing(hDimen(20)),
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
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //
              //
              //   ],
              // ),

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
                    'Jungle: Zone 4',
                  );
                  widget.onExpand(4);
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
            "Jungle: Zone 4 (Total animals highlighted: 7)",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: hDimen(24),
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child:GridView.builder(
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
                  audioPath: audioPathsF[index+17],
                  assetsPath: animalImagesZone4[index],
                  description: descriptionsZone4[index],
                  animalName: animalNamesZone4[index],
                );
              }),
              itemCount: descriptionsZone4.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
