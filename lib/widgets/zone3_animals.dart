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
    'Polar Bears are the largest land predators in the world and can weigh over\n1,300 pounds. Polar bears or white bears are found in the arctic of North America, as well\nas Eurasia. Adapted to life on the ice as well as the mainland, they are a top predator wherever\nthey are found. These bears have adapted to life in the artic very well: they have black skin\nto absorb the sun, wide feet to help walk on snow as well as swim, and 3 eyelids to help\nprotect their eyes from the elements.  Their closest relative is the Alaskan Brown Bear.',
   ];
  List<String> scientificNames = [

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

  Widget animalDetailCard({
    String name,
    String description,
    String imgPath,
    String italicName,
    Widget Species,
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
              "Bears: Polar Bear  (",
              style: TextStyle(
                color: Colors.black,
                fontSize: hDimen(24),
              ),
            ),
            Text(
              "Urus martimus",
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
                      text: 'Polar Bears are the largest land predators in the world and can weigh over\n1,300 pounds. Polar bears or white bears are found in the arctic of North America, as well\nas Eurasia. Adapted to life on the ice as well as the mainland, they are a top predator wherever\nthey are found. These bears have adapted to life in the artic very well: they have black skin\nto absorb the sun, wide feet to help walk on snow as well as swim, and 3 eyelids to help\nprotect their eyes from the elements.  Their closest relative is the Alaskan Brown Bear.',
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
                      text: 'Bear Species Types: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: 'there are 11 Huntable Species including the ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: 'Polar Bear, ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: hDimen(20),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: 'Brown,\nGrizzly, Black, ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: 'White Lipped',
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
        ),
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
                  'assets/Polar Bear.jpg',
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
            "Cave: Zone 3 (Total animals highlighted: 1)",
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
