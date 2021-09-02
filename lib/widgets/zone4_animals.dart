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
    'The Zebra Duiker has many different names depending on where you find them:\nZebra Duiker, Zebra Antelope, Banded Duiker, Striped Duiker, Marked Deer or Mountain Deer.\nThey live in the dense rainforests of Sierra Leone, Libera and the Southwest Ivory Coast.\nLike their name suggests, they have very distinguishable striped markings ranging from\n12-16 stripes. They are very wary animals that are rarely seen with diurnal habits.',
    'Once thought to be a subspecies of the Harvey’s Duiker or the Peters Duiker,\nAders are now considered to be their own species. Native to coastal forests on the\ncoast of Kenya, they also have a strong population in Zanzibar. Aders have notable white\nmarkings on their legs and lower body.  These duikers are very secretive and alert, making\nthem extremely elusive and rarely seen with diurnal habits.',
    'Royal Antelope are the smallest antelope in the world. Weighing in at 4-6\npounds and 10 inches at the shoulder, and living in dense forests, these animals are\nextremely alert and wary.  Their size and habitat, paired with their mostly nocturnal\ntendencies, make them very rarely seen. Found from Guinea to Gana, they have developed\nseveral names with the locals, including King of Hares, which led to their name the Royal\nAntelope, as well as Tricky-Jack and Jackrabbit.',
    'The Bongo is one of the larger species in the Spiral Horn family, second to\nthe Eland and Kudu. Bongo have an auburn or chestnut color with 10 to 15 stripes, allowing\nthem to blend into the dense forest well. With a good sense of hearing and a\nnervous temperament, Bongo are wary animals and are difficult to find. The Eastern Bongo\nare found in regions in the Central African Republic and the Congo, and the Western Bongo are\nfound mainly in the forests of Sierra Leone.',
    'Nile buffalo are cousins to the well-known Cape Buffalo. A distinct\ncharacteristic that separates the two is how the Nile Buffalo’s horns do not dip below the\nskull line. Native to parts of the Sudan, Ethiopia, Congo and Uganda, these buffalo are herd\nanimals and can be aggressive when provoked.',
    'Giant Forest Hogs or Forest Hogs are the largest swine in the world. With\nlarge, pronounced heads, characteristically loud grunting, growling and squealing, and\ngiant warty growths under their eyes, they live in lowland marshes to as high as 13,000 feet\nin dense forests. They are primarily nocturnal, but in places with limited pressure they can be\nincreasingly diurnal. Living in small groups of 4-15, they are found in regions of Nigeria,\nCameroon, Gabon, Central African Republic, Congo, Sudan, Uganda, Ethiopia, Kenya and\nTanzania.',
    'There are three main species of Brocket Deer, with several subspecies of each:\nthe Red, Grey-Brown and the Yucatan Grey-Brown Brocket Deer. These deer live in\nsavannas, forest edges and rainforests, with some of the subspecies also living in Central and\nSouth America, the Yucatan peninsula and the island of Trinidad. Primarily nocturnal and shy, it\nis difficult to find all species of Brocket Deer.',
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

  Widget nileBuffaloSpeciesTypes() {
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
                  text: 'Other Oxen Species of Africa: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Cape Buffalo, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text:
                      'Nile Buffalo, Dwarf Forest Buffalo, Western\nAfrica Savanna Buffalo, Central African, Savanna Buffalo',
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

  Widget bongoSpeciesTypes() {
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
                  text: 'Eastern Bongo, Western Bongo',
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

  Widget giantForestHogSpeciesType() {
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
                      text: 'Other Pig Species: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text:
                          'Warthog, Giant Forest Hog, Red River Hog, Bushpig, European Boar,\nRussian Boar, Feral Boar',
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
                      text: 'Other Peccary Species: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: 'Javelina, White-lipped Peccary, Collared',
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

  Widget duikerSpeciesTypes() {
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
                  text: 'Duiker Species Types: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Abbott, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Aders, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text:
                      'Angolan, Bay, Black, Black-Fronted, Blue, East African\nBush, Gabon, Harvey, Jentink, Maxwell, Natal Red, Ogilby, Peters, Red-Flanked, Southern Bush,\nWestern Bush, Weyns, Yellow-Backed, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Zebra',
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

  Widget brocketDeerSpeciesTypes() {
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
                      'Red and Grey-Brown Brocket, Yucatan Grey-Brown Brocket',
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

  Widget animalDetailCard({
    String name,
    String description,
    String imgPath,
    String italicName,
    bool isBrocketDeer,
    bool isDuiker,
    bool isGiantHog,
    bool isBongo,
    bool isNileBuffalo,
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
        isNileBuffalo
            ? nileBuffaloSpeciesTypes()
            : isBongo
                ? bongoSpeciesTypes()
                : isGiantHog
                    ? giantForestHogSpeciesType()
                    : isDuiker
                        ? duikerSpeciesTypes()
                        : isBrocketDeer
                            ? brocketDeerSpeciesTypes()
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
            "Jungle: Zone 4 (Total animals highlighted: 7)",
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
