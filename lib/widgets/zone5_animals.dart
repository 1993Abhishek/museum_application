import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';

class Zone5Animals extends StatefulWidget {
  const Zone5Animals({Key key}) : super(key: key);

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

  Widget maskDeerSpeciesTypes() {
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
                  text: 'Asian Musk Deer, Himalayan Musk Deer',
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

  Widget lynxSpeciesTypes() {
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
                  text: 'Lynx (North American and Eurasian), Bobcats',
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

  Widget capercaillieSpeciesTypes() {
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
                  text: 'Ivory and Black Billed Capercaillie',
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
    bool isMaskDeer,
    bool isLynx,
    bool isCapercaillie,
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
        isMaskDeer
            ? maskDeerSpeciesTypes()
            : isCapercaillie
                ? capercaillieSpeciesTypes()
                : isLynx
                    ? lynxSpeciesTypes()
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
            "Stairway Cover: Zone 5 (Total animals highlighted: 3)",
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
                      isCapercaillie: index == 2 ? true : false,
                      isLynx: index == 1 ? true : false,
                      isMaskDeer: index == 0 ? true : false,
                      name: animalNamesZone5[index],
                      italicName: scientificNames[index],
                      description: descriptionsZone5[index],
                      imgPath: animalImagesZone5[index],
                    ),
                  );
                },
                childCount: animalNamesZone5.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
