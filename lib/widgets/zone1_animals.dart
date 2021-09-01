import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class Zone1Animals extends StatefulWidget {
  const Zone1Animals({Key key}) : super(key: key);

  @override
  _Zone1AnimalsState createState() => _Zone1AnimalsState();
}

class _Zone1AnimalsState extends State<Zone1Animals> {

  AudioPlayer audioPlayer = AudioPlayer(
    mode: PlayerMode.MEDIA_PLAYER,
  );

  String mp3Uri;

  @override
  void initState() {
    _load();
    super.initState();
  }

  Future<Null> _load() async {
    final ByteData data = await rootBundle.load(
      'audio/Zone 1.1 - Leopard.mp3',
    );
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/demo.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
    print('finished loading, uri=$mp3Uri');
    if(mp3Uri.isNotEmpty)
      {
        play();
      }
    else{
      print('Error');
    }
  }

  void play() async {
    int result = await audioPlayer.play(
      mp3Uri,
      isLocal: true,
    );
    if (result == 1) {
      print('Success');
    }
  }

  void stop() async {
    await audioPlayer.stop();
  }

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
    'The Leopard has a very large distribution throughout central and southern\nAfrica, with 12 known subspecies. As largely solitary animals, they are known to be\nnocturnal in their hunting. With some of their best senses being smell and hearing,\nthese cats are very wary. The largest specimens can weigh over 170 pounds and live from\n10 to 15 years.',
    'The Greater Kudu, which has 7 different subspecies, and the Lesser Kudu\nhave a vast range and can be found throughout eastern, central and southern Africa. They\ncan be solitary animals or live in small groups.  Of the Spiral Horn of Africa, they are\nsecond only to the Eland. They are well known as the “grey ghost” as their grey\nand stipped hair is perfect camouflage for the savanna and mountain terrain. In addition\nto the Kudu, there are 26 Spiral Horn Antelope subspecies in Africa.',
    'there are three main species of Sable, all located in eastern to southern\nAfrica. These majestic animals are in the same family as the Roan (Hippotragus).\nSable live in the savanna woodland and grasslands. They are largely herd animals,\nbut when their numbers get larger it is common for small male bachelor groups to form.\nThese large Bovines can weigh upwards of 500 poundsand live to 15 years old.',
    'Kob are found in the remote areas of Africa, ranging from Uganda to the\nSudan. There are two main species of Kob: Uganda and White-eared, both in the Ringed\nHorn antelope family. Large herds can be found numbering in the thousands, but they can\nalso be found in smaller numbers. Large males can weigh up to 200 pounds and live to be\n17 years old.',
    'Hartebeeste, also known as, Kongoni, have 8 direct subspecies. Their distribution\nis from Western Africa all the way east to Tanzania, then south throughout\nsouthern Africa. As herd animals, they can be found in dry grasslands, wooded grasslands\nand open plains in search of suitable vegetation. Hartebeest are in the genus Alcelaphus,\nweighing up to 350 pounds and living to 12-15 years old.',
    'These unique animals are also called the “giraffe gazelle” and find their\nhome in the drier ranges of East Africa. There are two different subspecies of Gerenuk:\nNorthern and Southern. The Northern Gerenuk is found in regions of Ethiopia and Somalia,\nand the Southern is found in Tanzania and Kenya. They are the only species in\nthe genus Litocranius and can live up to 8 years old. It is considered one of\nthe Ringed Horn Animals.',
    'Korrigum, also known as the Senegal Hartebeeste, is part of the Topi family.\nAlso referred to as the “Giant Topi,” they are currently found throughout Chad, although\nthey were once found in Senegal (from where they are now extinct). These animals are\noften found in groups of 15 to 30, but you can also find them migrating in groups numbering\nin the thousands. They can live up to 15 years old.',
    'These very social pack animals have many different names: hunting dogs,\npainted hunting dogs, painted dogs and painted Lycaon.  Scientists now are pushing to\nrebrand this species as the “painted wolf,” as the name wild dog can have a negative\nconnotation for the species. Their packs have a distinct hierarchy and can have upwards\nof 20-30 members per pack plus pups. Each member has a distinct role. Their range is\nmainly through sub-Saharan Africa: Ethiopia, Tanzania and Kenya, as well as southern Africa,\nBotswana, Namibia, Zimbabwe, and South Africa. They can live up to 12 years, with the average\nspan being 5 to 7 years.',
    'The Aardwolf is the smallest species in the family Hyaenidae and is\ninsectivorous. The name Aardwolf means “Earth-Wolf” in Afrikaans. The territory of the\nspecies is vast as their preferred food source, termites, can be found in many areas; this\nspecies has range in Northern, Southern, and Eastern Africa, where there are grasslands\nand savannas. These solitary, nocturnal animalscan live up to 12 years old.',
    'This ground dwelling monkey has a territory that ranges from Central\nWest Africa through Central East Africa. Within their range, they are broken down into\ntwo species: Eastern and Western Patas Monkey. These species of monkey live in\nsemi-arid terrain, living in groups upwards of sixty individuals. They are considered\nto be the only member of the genus Erythrocebus and can live to 20 years old.',
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

  Widget bulletIcon() {
    return Container(
      height: hDimen(15),
      width: hDimen(15),
      decoration: BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget bulletIconEmpty() {
    return Container(
      height: hDimen(15),
      width: hDimen(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget tigerSpeciesTypes() {
    return Padding(
      padding: EdgeInsets.only(left: hDimen(80)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: hDimen(3)),
            child: bulletIconEmpty(),
          ),
          hSpacing(hDimen(10)),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'African Species Types: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'African Lion, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Leopard, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Cheetah, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Caracal Cat, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Serval Cat, Genet Cat, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: '\nAfrican Wild Cat.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget kuduSpeciesTypes() {
    return Padding(
      padding: EdgeInsets.only(left: hDimen(80)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: hDimen(3)),
            child: bulletIconEmpty(),
          ),
          hSpacing(hDimen(10)),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Species Types: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text:
                      'Bushbok (8 Species), Nyala (2 Species), Kudu (7 Species), Eland (5 Species),\nSitatunga (4 Species)',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sableSpeciesType() {
    return Padding(
      padding: EdgeInsets.only(left: hDimen(80)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: hDimen(3)),
                child: bulletIconEmpty(),
              ),
              hSpacing(hDimen(10)),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Sable Species Types: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: 'Common, Giant, Roosevelt',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: hDimen(3)),
                child: bulletIconEmpty(),
              ),
              hSpacing(hDimen(10)),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Roan Species Types: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: 'East African, Southern, Sudan, Western',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget kobSpeciesTypes() {
    return Padding(
      padding: EdgeInsets.only(left: hDimen(80)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: hDimen(3)),
            child: bulletIconEmpty(),
          ),
          hSpacing(hDimen(10)),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Ringed Horn Species Types: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Kob, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Lechwe, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Waterbok , ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'and Puku',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hartebeastSpeciesTypes() {
    return Padding(
      padding: EdgeInsets.only(left: hDimen(80)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: hDimen(3)),
            child: bulletIconEmpty(),
          ),
          hSpacing(hDimen(10)),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Species Types: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text:
                      'Red, Coke, Jackson, Kenya Highland, Korrigum, Lelwel, Lichenstain,\nNeumann, Swayne, Western',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget monkeySpeciesTypes() {
    return Padding(
      padding: EdgeInsets.only(left: hDimen(80)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: hDimen(3)),
            child: bulletIconEmpty(),
          ),
          hSpacing(hDimen(10)),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'Similar Monkey Species Types: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Vervet Monkey, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Colobus Monkey, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: 'Baboon',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget animalDetailCard({
    String name,
    String description,
    String imgPath,
    String italicName,
    bool isTiger,
    bool isKudu,
    bool isSable,
    bool isKob,
    bool isHartebeast,
    bool isMonkey,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            hSpacing(hDimen(20)),
            bulletIcon(),
            hSpacing(hDimen(20)),
            Text(
              "$name (",
              style: TextStyle(
                color: Colors.black,
                fontSize: hDimen(24),
              ),
            ),
            Text(
              "$italicName",
              style: TextStyle(
                color: Colors.black,
                fontSize: hDimen(24),
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              " )",
              style: TextStyle(
                color: Colors.black,
                fontSize: hDimen(24),
              ),
            ),
          ],
        ),
        vSpacing(hDimen(15)),
        Padding(
          padding: EdgeInsets.only(left: hDimen(80)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: hDimen(3)),
                child: bulletIconEmpty(),
              ),
              hSpacing(hDimen(10)),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: ' Description: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: description,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        vSpacing(hDimen(15)),
        isTiger
            ? tigerSpeciesTypes()
            : isKob
                ? kobSpeciesTypes()
                : isSable
                    ? sableSpeciesType()
                    : isMonkey
                        ? monkeySpeciesTypes()
                        : isHartebeast
                            ? hartebeastSpeciesTypes()
                            : isKudu
                                ? kuduSpeciesTypes()
                                : Container(),
        vSpacing(hDimen(20)),
        Center(
          child: Container(
            color: Colors.transparent,
            height: hDimen(400),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(hDimen(25)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(hDimen(25)),
                child: Image.asset(
                  imgPath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

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
            child: ListView.custom(
              childrenDelegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: hDimen(20),
                    ),
                    child: animalDetailCard(
                      isHartebeast: index == 4 ? true : false,
                      isTiger: index == 0 ? true : false,
                      isKudu: index == 1 ? true : false,
                      isKob: index == 3 ? true : false,
                      isSable: index == 2 ? true : false,
                      isMonkey: index == animalNamesZone1.length - 1 ? true : false,
                      name: animalNamesZone1[index],
                      italicName: scientificNames[index],
                      description: descriptionsZone1[index],
                      imgPath: animalImagesZone1[index],
                    ),
                  );
                },
                childCount: animalNamesZone1.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
