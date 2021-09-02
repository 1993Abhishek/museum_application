import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';

class Zone7Animals extends StatefulWidget {
  final Function onExpand;
  const Zone7Animals({Key key,this.onExpand}) : super(key: key);

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
    'Buffalo: Dwarf Forest Buffalo',
    'Gazelle: Saiga Gazelle',
  ];
  List<String> descriptionsZone7 = [
    'Giant Eland or Lord Derby Eland are the largest of the Antelope species. Found\nin the forested savannas of central Africa, they call parts of Nigeria, Cameroon, Congo, Central\nAfrican Republic and the Sudan home. Living in groups up to 30 animals, they are naturally\nvery alert and wary, making them difficult to get close to and often on the constant move.\nFor a large animal, they can run up to 40mph to escape threats. They are part of the Spiral\nHorns of Africa.',
    'Mountain Nyala are one of the largest of the Spiral Horned antelope of Africa.\nA Nyala by species, they are referred to by the local Ethiopians as the “highland greater kudu,”\nliving in dense forests of central Ethiopia at altitudes up to 13,000 feet. Very shy and elusive\nanimals, they spend a lot of time in the dense forest away from any human pressure\nand are most active from dusk till dawn searching for food.',
    'Dwarf Forest Buffalo, also referred to as Dwarf Buffalo or the Congo Buffalo,\nare the smallest species of buffalo in Africa. Their horns do not sweep down, which is typical\nof other buffalo, but they sweep out and back. Their ears are also a unique characteristic\nas they have large tuffs of hair on the ends. They live in dense rainforests and in smaller\ngroups than their cousins, the Cape Buffalo, with numbers ranging in the 30s. They are found\nin west African in different regions of Guinea, Sierra Leone, Ghana, and Nigeria. They’re\nalso found in Central Africa in Central African Republic, Congo, Cameroon, Rio Muni, Gabon,\nand Angola.',
    'There are two main subspecies of Saiga Antelope. They are a unique looking\nantelope with large noses made to help filter the dust and debris from their nomadic lifestyle.\nIn the winter it also warms the cold air before it’s breathed in. They are found in large herds\ntraveling the grasslands on the footsteps of the mountains of Mongolia, Kazakhstan,\nUzbekistan and regions of Russia. These animals are on the decline due mainly to poaching\nfor their meat as well as their horns for traditional Asian medicine. Large conservation\nefforts are underway to help bring the Saiga antelope back to its large\nnumbers and to continue to be nomadic icons.',
  ];
  List<String> scientificNames = [
    'Taurotragus debianus',
    'Tragelaphus buxtoni',
    'Syncerus caffer nanus',
    'Saiga tatarica',
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

  Widget derbyElandSpeciesTypes() {
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
                      'East African (Pattersons), Cape, Lord Derby Eland, Giant Eland, Livingstone',
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

  Widget mountainNylaSpeciesTypes() {
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
                  text: 'Mountain Nyala, Common Nyala',
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

  Widget dwarfSpeciesTypes() {
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
                      'Bison, Musk Ox, Gaur, Vancouver Bull, Bantang, Water buffalo, Yak,\nCape Buffalo, ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: 'Dwarf Forest buffalo',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text: ', Nile Buffalo, Western African Savanna Buffalo',
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

  Widget saigaSpeciesTypes() {
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

  Widget animalDetailCard({
    String name,
    String description,
    String imgPath,
    String italicName,
    bool isDerby,
    bool isNyla,
    bool isBuffalo,
    bool isGazelle,
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
        isDerby
            ? derbyElandSpeciesTypes()
            : isNyla
                ? mountainNylaSpeciesTypes()
                : isBuffalo
                    ? dwarfSpeciesTypes()
                    : isGazelle
                        ? saigaSpeciesTypes()
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
            "Old Trophy Room: Zone 7 (Total animals highlighted: 4)",
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
                      isBuffalo: index == 2 ? true : false,
                      isDerby: index == 0 ? true : false,
                      isGazelle: index == 3 ? true : false,
                      isNyla: index == 1 ? true : false,
                      name: animalNamesZone7[index],
                      italicName: scientificNames[index],
                      description: descriptionsZone7[index],
                      imgPath: animalImagesZone7[index],
                    ),
                  );
                },
                childCount: animalNamesZone7.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
