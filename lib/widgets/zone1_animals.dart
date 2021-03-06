import 'dart:convert';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class Zone1Animals extends StatefulWidget {
  final Function onExpand;

  const Zone1Animals({
    Key key,
    this.onExpand,
  }) : super(key: key);

  @override
  _Zone1AnimalsState createState() => _Zone1AnimalsState();
}

class _Zone1AnimalsState extends State<Zone1Animals> {
  AudioPlayer audioPlayer = AudioPlayer(
    mode: PlayerMode.MEDIA_PLAYER,
  );

  String mp3Uri;

  List<String> animalImagesZone1 = [
    'assets/Leopard.jpg',
    'assets/Greater Kudu.jpg',
    'assets/Sable .jpg',
    'assets/Uganda Kob.jpg',
    'assets/Jackson Hartebeeste.jpg',
    'assets/Gerenuk .jpg',
    'assets/Korrigum.jpg',
    'assets/Wild Dog.jpg',
    'assets/aardwolf.jpg',
    'assets/Patas Monkey.jpg',
  ];
  List<String> animalNamesZone1 = [
    'Leopard',
    'Greater Kudu',
    'Sable',
    'Uganda Kob',
    'Jackson Hartebeest',
    'Gerenuk',
    'Korrigum',
    'Wild Dog',
    'Aardwolf',
    'Patas Monkey',
  ];
  List<String> descriptionsZone1 = [
    'The Leopard has a very large distribution throughout central and southern Africa, with 12 known subspecies. As largely solitary animals, they are known to be nocturnal in their hunting. With some of their best senses being smell and hearing, these cats are very wary. The largest specimens can weigh over 170 pounds and live from 10 to 15 years.',
    'The Greater Kudu, which has 7 different subspecies, and the Lesser Kudu have a vast range and can be found throughout eastern, central and southern Africa. They can be solitary animals or live in small groups.  Of the Spiral Horn of Africa, they are second only to the Eland. They are well known as the ???grey ghost??? as their grey and stipped hair is perfect camouflage for the savanna and mountain terrain. In addition to the Kudu, there are 26 Spiral Horn Antelope subspecies in Africa.',
    'there are three main species of Sable, all located in eastern to southern Africa. These majestic animals are in the same family as the Roan (Hippotragus). Sable live in the savanna woodland and grasslands. They are largely herd animals, but when their numbers get larger it is common for small male bachelor groups to form. These large Bovines can weigh upwards of 500 poundsand live to 15 years old.',
    'Kob are found in the remote areas of Africa, ranging from Uganda to the Sudan. There are two main species of Kob: Uganda and White-eared, both in the Ringed Horn antelope family. Large herds can be found numbering in the thousands, but they can also be found in smaller numbers. Large males can weigh up to 200 pounds and live to be 17 years old.',
    'Hartebeeste, also known as, Kongoni, have 8 direct subspecies. Their distribution is from Western Africa all the way east to Tanzania, then south throughout southern Africa. As herd animals, they can be found in dry grasslands, wooded grasslands and open plains in search of suitable vegetation. Hartebeest are in the genus Alcelaphus, weighing up to 350 pounds and living to 12-15 years old.',
    'These unique animals are also called the ???giraffe gazelle??? and find their home in the drier ranges of East Africa. There are two different subspecies of Gerenuk: Northern and Southern. The Northern Gerenuk is found in regions of Ethiopia and Somalia, and the Southern is found in Tanzania and Kenya. They are the only species in the genus Litocranius and can live up to 8 years old. It is considered one of the Ringed Horn Animals.',
    'Korrigum, also known as the Senegal Hartebeeste, is part of the Topi family. Also referred to as the ???Giant Topi,??? they are currently found throughout Chad, although they were once found in Senegal (from where they are now extinct). These animals are often found in groups of 15 to 30, but you can also find them migrating in groups numbering in the thousands. They can live up to 15 years old.',
    'These very social pack animals have many different names: hunting dogs, painted hunting dogs, painted dogs and painted Lycaon.  Scientists now are pushing to rebrand this species as the ???painted wolf,??? as the name wild dog can have a negative connotation for the species. Their packs have a distinct hierarchy and can have upwards of 20-30 members per pack plus pups. Each member has a distinct role. Their range is mainly through sub-Saharan Africa: Ethiopia, Tanzania and Kenya, as well as southern Africa, Botswana, Namibia, Zimbabwe, and South Africa. They can live up to 12 years, with the average span being 5 to 7 years.',
    'The Aardwolf is the smallest species in the family Hyaenidae and is insectivorous. The name Aardwolf means ???Earth-Wolf??? in Afrikaans. The territory of the species is vast as their preferred food source, termites, can be found in many areas; this species has range in Northern, Southern, and Eastern Africa, where there are grasslands and savannas. These solitary, nocturnal animalscan live up to 12 years old.',
    'This ground dwelling monkey has a territory that ranges from Central West Africa through Central East Africa. Within their range, they are broken down into two species: Eastern and Western Patas Monkey. These species of monkey live in semi-arid terrain, living in groups upwards of sixty individuals. They are considered to be the only member of the genus Erythrocebus and can live to 20 years old.',
  ];
  List<String> scientificNames = [
    'Panthera pardus pardus',
    'Tragelaphus strepsciceros',
    'Martes zibellina',
    'Kobus kob thomasi',
    'Alcelaphs buselaphus',
    'Litocranius walleri',
    'Damaliscus lanatus korrigum',
    'Lycaon pictus',
    'Proteles cristata',
    'Erythrocebus patas',
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
    bool isKudu=false,
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
          'scientificName',
          scientificName,
        );
        SharedPreference.saveStringPreference(
          'zoneName',
          'African Diorama: Zone 1',
        );
        if(isKudu)
        {
          SharedPreference.saveBoolPreference('kudu', true);
        }
        SharedPreference.saveBoolPreference('kudu', true);
        widget.onExpand(1);
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
                    fit: BoxFit.fill,
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
              // vSpacing(hDimen(20)),
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
                    'African Diorama: Zone 1',
                  );
                  if(isKudu)
                    {
                      SharedPreference.saveBoolPreference('kudu', true);
                    }
                  SharedPreference.saveBoolPreference('kudu', true);
                  widget.onExpand(1);
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
    'audio/Zone1.2-GreaterKudu.mp3',
    'audio/Zone1.3-Sable.mp3',
    'audio/Zone1.4-UgandaCobb.mp3',
    'audio/Zone1.5-JacksonHeartBeast.mp3',
    'audio/Zone1.6-Gerenuk.mp3',
    'audio/Zone1.7-Korrigum.mp3',
    'audio/Zone1.8-WildDog.mp3',
    'audio/Zone1.9-Aardwolf.mp3',
    'audio/Zone1.10-PatasMonkey.mp3',
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

  // bool isLoadingAudios = false;
  //
  // Future _initAudios() async {
  //   print('Audios');
  //   setState(() {
  //     isLoadingAudios = true;
  //   });
  //   final manifestContent =
  //   await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
  //
  //   final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  //   final audioPaths = manifestMap.keys
  //       .where((String key) => key.contains('audio/'))
  //       .where((String key) => key.contains('.mp3'))
  //       .toList();
  //   print(audioPaths);
  //   setState(() {
  //     audioPathsF=audioPaths;
  //   });
  //   print('Audios:$audioPathsF');
  //   print('Audios:${audioPathsF[0]}');
  //   setState(() {
  //     isLoadingAudios = false;
  //   });
  // }

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
            "African Diorama: Zone 1 (Total animals highlighted:10)",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: hDimen(24),
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child:
                /*isLoadingAudios
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: AppColor.colorPrimary,
                    ),
                  )
                : */
                GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: hDimen(10),
                crossAxisSpacing: hDimen(10),
                crossAxisCount:
                    /*orientation == Orientation.portrait ? 2 :*/ 3,
                childAspectRatio: 0.6,
              ),
              itemBuilder: ((context, index) {
                return searchAnimalCard(
                  isKudu: index==1 ? true: false,
                  scientificName: scientificNames[index],
                  audioPath: audioPathsF[index],
                  assetsPath: animalImagesZone1[index],
                  description: descriptionsZone1[index],
                  animalName: animalNamesZone1[index],
                );
              }),
              itemCount: descriptionsZone1.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
