import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';

class Zone2Animals extends StatefulWidget {
  final Function onExpand;
  const Zone2Animals({Key key,this.onExpand,}) : super(key: key);

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
    'Urials / Mouflon: Konya Sheep',
    'North American: Texas Bighorn',
    'Markhor',
    'Ibex: Mid-Asian',
    'Goats: Himalayan Tahr',
  ];
  List<String> descriptionsZone2 = [
    'Argali are the largest of the wild sheep species in the world, with the largest\nargali subspecies found in Mongolia. The word Argali is the Mongol word meaning Wild Sheep.\nThese sheep live in elevations ranging from 1,000 – 19,000 feet. Their horns can weigh as\nmuch as 50 pounds and reach over 60 inches in length.  Argali are also the largest bodied\nof the ovis family: they can be 200 pounds and can live up to 13 years old.',
    'Urials have 9 different direct subspecies and are closely related the Mouflon\nfamily.  Some scientists say they should all be classified in one genus. These sheep are\nthe smallest subspecies of ovis living throughout Asia, mostly in the arid countries\nof Pakistan, Iran, Afghanistan, Uzbekistan, and Tajikistan. Large rams would top the\nscales at 110 pounds. These sheep can live up to 13,000 feet in elevation.',
    'There are 4 main species of sheep that make up the North American Grand Slam:\nDesert Bighorn, Rocky Mountain Bighorn, Dall Sheep and Stone Sheep. There are different\nsubspecies of Desert Bighorn that range from the southern United States through Mexico.\nThe Texas Bighorn, or Nelson Bighorn, is found in pockets of west and south Texas.\nThere is a large conservation effort to help bring these iconic sheep back to their home\nrange. Throughout the US, many conservation organizations are helping introduce and\nmanage bighorns in their home ranges: from the west through the Midwest. A large ram’s\nhorns will weigh up to thirty pounds.',
    'There are 5 main subspecies of Markhor that are found in Tajikistan, Afghanistan,\nPakistan, and India, living upwards of 12,000 feet.  Markhor are all in the genus Capra\nsubspecies Capriae. There is a large conservation effort in their home ranges to emphasize\nthe importance of these animals with the local people and governments. Without\nconservation these animals are poached because it is said their horns have healing\nproperties.',
    'there are 16 huntable species of Ibex from Europe to Asia. The Mid-Asian Ibex\nfrom Tajikistan is the largest subspecies that can have horns over 45 inches and weigh 300\npounds. The smallest subspecies is native to Greece and tips the scales at 100 pounds.',
    'One of the most iconic of the Capra species, Tahr is known for its big mane that\ngets long and dense in the winter extending from its neck through its shoulders. These animals\ncan be found in their native range Nepal, as well as in their introduced home of New Zealand.\nThe New Zealand Tahr is a self-sustaining wild population. They can be found living\nupwards of 16,000 feet.'
  ];
  List<String> scientificNames = [
    'ovis ammon',
    'Ovis orientalis anatolica',
    'Ovis canadensis nelson',
    'Capra falconeri',
    'Capra sibirca',
    'Hemitragus jemlahicus',
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

  Widget argaliSpeciesTypes() {
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
                  text: 'Argali Species Types: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
                TextSpan(
                  text:
                      ': Altai, Karaganda, Gobi, Tibetan, North China, Tian Shan, Kara Tau,\nMarco Polo, Severtzov',
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

  Widget texasBighornSpeciesTypes() {
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
                      'Desert Bighorn, Texas Bighorn, Stone Sheep, Rocky Mountain Bighorn,\nDall Sheep, California Big Horn, Fannin Sheep ',
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

  Widget konyaSheepSpeciesType() {
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
                      text: 'Urial Species Types ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text: 'Punjab, Afghan, Blanford, Mouflon',
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
                      text: 'Mouflon Species Types: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text:
                          'Armenian, European, Iberian, Corsican, Esfahan, Konya,\nLaristan, Shiraz, Aoudad, Red Sheep, Kerman',
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

  Widget markhorSpeciesTypes() {
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
                  text: 'Kashmir, Suliman, Astor, Bukhoran, Kabul',
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

  Widget midAsianSpeciesTypes() {
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
                      'Alpine, Bezoar, Mid-Asian, Altai, Gobi, Sindh, Kri Kri, Gredos, Beceite,\nRonda, Southeaster Spanish, Nubian,\nPersian Desert Ibex, Himalayan, Hybrid',
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

  Widget tahrSpeciesTypes() {
    return Padding(
      padding: EdgeInsets.only(left: hDimen(80)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      text: 'Species Types: ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: hDimen(20),
                      ),
                    ),
                    TextSpan(
                      text:
                          'There are many species of goats found throughout North America, Europe,\nAsia and Africa:',
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
          vSpacing(hDimen(20)),
          Padding(
            padding: EdgeInsets.only(
              left: hDimen(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(height: hDimen(15),width: hDimen(15),color: Colors.black,),
                hSpacing(hDimen(20)),
                Text(
                  'Tahr: New Zealand, Himalayan',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: hDimen(20),
                  ),
                ),
              ],
            )
          ),
          Padding(
              padding: EdgeInsets.only(
                left: hDimen(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: hDimen(15),width: hDimen(15),color: Colors.black,),
                  hSpacing(hDimen(20)),
                  Text(
                    'Mountain Goat: North America',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: hDimen(20),
                    ),
                  ),
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(
                left: hDimen(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: hDimen(15),width: hDimen(15),color: Colors.black,),
                  hSpacing(hDimen(20)),
                  Text(
                    'Tur: Easter, Mid-Caucasian, Western Tur ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: hDimen(20),
                    ),
                  ),
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(
                left: hDimen(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: hDimen(15),width: hDimen(15),color: Colors.black,),
                  hSpacing(hDimen(20)),
                  Text(
                    'Balarian Boc: Majorca ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: hDimen(20),
                    ),
                  ),
                ],
              )
          ),
          Padding(
              padding: EdgeInsets.only(
                left: hDimen(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: hDimen(15),width: hDimen(15),color: Colors.black,),
                  hSpacing(hDimen(20)),
                  Text(
                    'Chamois (including Pyrenean, Cantabrian, Alpine, Balkan, Carpathian, Anatolian,\nCaucasian, Tatra, Chartreuse, and South Pacific): throughout Europe and Asia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: hDimen(20),
                    ),
                  ),
                ],
              )
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
    bool isArgali,
    bool isKonyaSheep,
    bool isTexasBigHorn,
    bool isMarkhor,
    bool isMidAsian,
    bool isTahr,
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
        isArgali
            ? argaliSpeciesTypes()
            : isMidAsian
                ? midAsianSpeciesTypes()
                : isTahr
                    ? tahrSpeciesTypes()
                    : isMarkhor
                        ? markhorSpeciesTypes()
                        : isTexasBigHorn
                            ? texasBighornSpeciesTypes()
                            : isKonyaSheep
                                ? konyaSheepSpeciesType()
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
            "Mountain: Zone 2 (Total animals highlighted: 6)",
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
                      isArgali: index==0? true:false,
                      isKonyaSheep: index==1? true:false,
                      isTexasBigHorn: index==2? true:false,
                      isMarkhor: index==3?true:false,
                      isMidAsian: index==4?true:false,
                      isTahr: index==5?true:false,
                      name: animalNamesZone2[index],
                      italicName: scientificNames[index],
                      description: descriptionsZone2[index],
                      imgPath: animalImagesZone2[index],
                    ),
                  );
                },
                childCount: animalNamesZone2.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
