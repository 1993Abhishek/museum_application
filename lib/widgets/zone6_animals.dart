import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'dart:convert';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';

class Zone6Animals extends StatefulWidget {
  final Function onExpand;
  const Zone6Animals({Key key,this.onExpand,}) : super(key: key);

  @override
  _Zone6AnimalsState createState() => _Zone6AnimalsState();
}

class _Zone6AnimalsState extends State<Zone6Animals> {
  List<String> animalImagesZone6 = [
    'assets/Wood Bison.jpg',
    'assets/Wolf.jpg',
    'assets/Rhino, Black.jpg',
  ];
  List<String> animalNamesZone6 = [
    'Wood Bison',
    'Wolf',
    'Rhino',
  ];
  List<String> descriptionsZone6 = [
    'The largest of the Bison species is the Wood Bison, also called the Wood Buffalo\nor Mountain Buffalo. Found mainly in northern boreal forests, their bodies are a lot denser with\nthicker, darker hair than their cousins, the Plains Bison. Wood Bison are found in Alaska,\nNorthwest Territories, Yukon, Northern British Columbia and Northern Alberta. Due to large\nconservation efforts, their range is expanding with healthy populations.',
    'The Grey Wolf can be found in North America, Europe and Asia reaching upwards\nof 120 pounds. As very social pack animals, each wolf family has a distinct dynamic with each\nmember having a specific role. Pups are taught to hunt in packs, which have made them very\nproficient and deadly hunters. Due to great conservation efforts, wolf populations are growing\nand thriving throughout their native homelands, which are often in northern\nlatitudes. There are some 24 different subspecies of wolf in North America alone.',
    'Rhinoceros, or Rhino, are one of the last remaining Megafauna. Getting their name\nfrom the Latin “Nose Horn,” there are 2 remaining species in Africa: the Black and the White\nRhino. With a great sense of hearing and smell but poor eyesight, Rhinos can be easily\nambushed in the proper conditions. They are often poached for their horns, which are used\nas medicine and an aphrodisiac in Asia. Due to significant poaching, the Asian species of\nRhino are under extreme threat.However, thanks to great conservation efforts in Africa,\nthe Black and White Rhino populations are now growing and becoming very healthy in many\nregions.',
  ];
  List<String> scientificNames = [
    'Bison bison athabascae',
    'Canis lupis',
    'Rhinocerotidae',
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

    for (var i = 0; i < 10; i++) {
      String path = audioPaths[i].replaceAll('%20', '');
      print('path: $path');
      audioPathsF.add(path);
    }
    setState(() {});
    print('Audios:$audioPathsF');
    print('Audios:${audioPathsF[0]}');
    setState(() {
      isLoadingAudios = false;
    });
    // setState(() {
    //   someImages = imagePaths;
    // });
  }


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

  Widget bisonSpeciesTypes() {
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
                  text: 'Wood Bison, Plains Bison, European Bison or Weasen',
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

  Widget wolfSpeciesTypes() {
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
                  text: 'Timber Wolf, Grey Wolf, European Wolf',
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

  Widget rhinoSpeciesType() {
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
                      text: 'African Species Types: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text:
                          'White Rhino (Northern and Southern) and Black Rhino',
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
                      text: 'Asian Species Types: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: 'Indian Rhinoceros, Javan Rhino, Sumatran Rhino',
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

  Widget animalDetailCard({
    String name,
    String description,
    String imgPath,
    String italicName,
    bool isBison,
    bool isWolf,
    bool isRhino,
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
        isRhino
            ? rhinoSpeciesType()
            : isWolf
                ? wolfSpeciesTypes()
                : isBison
                    ? bisonSpeciesTypes()
                    : Container(),
        vSpacing(hDimen(20)),
        Center(
          child: Container(
            color: Colors.transparent,
            height: hDimen(500),
            child: Card(
              elevation: 4,
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
            "Mezzanine: Zone 6 (Total animals highlighted: 3)",
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
                  assetsPath: animalImagesZone6[index],
                  description: descriptionsZone6[index],
                  animalName: animalNamesZone6[index],
                );
              }),
              itemCount: descriptionsZone6.length,
              physics: BouncingScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
