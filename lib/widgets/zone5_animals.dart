import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'dart:convert';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';

class Zone5Animals extends StatefulWidget {
  final Function onExpand;
  const Zone5Animals({Key key,this.onExpand}) : super(key: key);

  @override
  _Zone5AnimalsState createState() => _Zone5AnimalsState();
}

class _Zone5AnimalsState extends State<Zone5Animals> {
  List<String> animalImagesZone5 = [
    'assets/Musk Deer.jpg',
    'assets/Lynx.jpg',
    'assets/Capercaillie .jpg',
  ];
  List<String> animalNamesZone5 = [
    'Musk Deer',
    'Lynx',
    'Capercaillie',
  ];
  List<String> descriptionsZone5 = [
    'Native to Mongolia, these deer have no antlers but large canines that look like\nfangs. The have also adapted longer hooves that allow them to climb trees to forage.\nTheir name derives from their large scent glands, which have led the animals to be poached\nfor black market perfume. Thanks to conservation efforts, their populations\nare on the rebound.',
    'Lynx are known for two main subspecies: North American and Eurasian.\nNorth American Lynx are found primarily in Canada and Northwest United States, and\nEurasian are found in Europe, Russia, Scandinavia, the Middle East, and Asia. Found in dense\nforests with thick secondary growth as well as rocky mountainous terrain, they are wary\nanimals who live a solitary life. Built to be able to track through heavy snow and as tireless\nwalkers with long legs and big feet, they are mostly nocturnal but can be found covering\ntheir territory throughout the day.',
    'Capercaillie are the largest of the Grouse species.  They are also known as Wood\nGrouse and as Cock of the Woods. There are two main species of Capercaillie, Ivory and Black\nBilled, with many known subspecies of each. Found throughout Europe, Scandinavia and\nRussia, they live in wooded forests. These large birds are known and sought after to\nwitness their mating rituals and to listen to the songs they sing.'
  ];
  List<String> scientificNames = [
    'Moschus moschiferus',
    'Lynx canadensis',
    'Terao urogallus',
  ];

  @override
  void initState() {
    // _load();
    _initAudios();
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
                  assetsPath,
                );
                widget.onExpand();
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

  List<String> audioPathsF = [];
  bool isLoadingAudios = false;
  Future _initAudios() async {
    print('Audios');
    setState(() {
      isLoadingAudios = true;
    });
    final manifestContent =
    await DefaultAssetBundle.of(context).loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final audioPaths = manifestMap.keys
        .where((String key) => key.contains('audio/'))
        .where((String key) => key.contains('.mp3'))
        .toList();
    print(audioPaths);
    setState(() {});
    print('Audios:$audioPathsF');
    print('Audios:${audioPathsF[0]}');
    setState(() {
      audioPathsF=audioPaths;
      isLoadingAudios = false;
    });
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
            "Stairway Cover: Zone 5 (Total animals highlighted: 3)",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: hDimen(24),
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child: isLoadingAudios
                ? Center(
              child: CircularProgressIndicator(
                backgroundColor: AppColor.colorPrimary,
              ),
            )
                : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: hDimen(20),
                crossAxisSpacing: hDimen(10),
                crossAxisCount:
                /*orientation == Orientation.portrait ? 2 :*/ 3,
                childAspectRatio: 0.9,
              ),
              itemBuilder: ((context, index) {
                return searchAnimalCard(
                  audioPath: audioPathsF[index],
                  assetsPath: animalImagesZone5[index],
                  description: descriptionsZone5[index],
                  animalName: animalNamesZone5[index],
                );
              }),
              itemCount: descriptionsZone5.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
