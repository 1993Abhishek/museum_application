import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:museum_application/widgets/customTextfieldwidget.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

class AnimalsScreen extends StatefulWidget {
  final Function onZoneBack;
  final int zoneIndex;

  const AnimalsScreen({
    Key key,
    this.onZoneBack,
    this.zoneIndex,
  }) : super(key: key);

  @override
  _AnimalsScreenState createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  String directory;
  List file = new List();

  FocusNode nodeSearchAnimal = FocusNode();
  TextEditingController controllerSearchAnimal = TextEditingController();
  String initDescription = 'The Leopard has a very large distribution throughout central and southern Africa, with 12 known subspecies. As largely solitary animals, they are known to be nocturnal in their hunting. With some of their best senses being smell and hearing, these cats are very wary. The largest specimens can weigh over 170 pounds and live from 10 to 15 years.';
  String initAnimalName = 'Leopard';
  String initScientificName = 'Panthera pardus pardus';

  String asset = "assets/Leopard.jpg";

  List<String> assetPaths = [
    "assets/loggerhead.jpg",
    "assets/national_geographic1.jpg"
  ];
  int imageIndex = 0;
  bool isGettingDetails = false;

  @override
  void initState() {
    getAnimalDetails();
    super.initState();
  }

  String mp3Uri;

  AudioPlayer audioPlayer = AudioPlayer(
    mode: PlayerMode.MEDIA_PLAYER,
  );

  Future<Null> _load() async {
    print('Audio Path: $audioPath');
    final ByteData data = await rootBundle.load(
      audioPath,
    );
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/demo.mp3');
    await tempFile.writeAsBytes(data.buffer.asUint8List(), flush: true);
    mp3Uri = tempFile.uri.toString();
    print('finished loading, uri=$mp3Uri');
    if (mp3Uri.isNotEmpty) {
      play();
    } else {
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

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  String audioPath = 'audio/Zone1.1-Leopard.mp3';
  String zoneName = "";
  bool isKudu=false;

  void getAnimalDetails() async {
    setState(() {
      isGettingDetails = true;
    });
    String description =
        await SharedPreference.getStringPreference('description');
    String animalName = await SharedPreference.getStringPreference('name');
    String imagePath = await SharedPreference.getStringPreference('imgPath');
    String audioPath2 = await SharedPreference.getStringPreference('audioPath');
    String scientificName = await SharedPreference.getStringPreference(
      'scientificName',
    );
    zoneName = await SharedPreference.getStringPreference(
      'zoneName',
    );


    bool kudu= await SharedPreference.getBoolPreference('kudu');
    print('Scientific Name:$zoneName');
    if(kudu==null)
      {
        kudu=false;
      }
    if (description.isNotEmpty &&
        animalName.isNotEmpty &&
        imagePath.isNotEmpty &&
        audioPath2.isNotEmpty &&
        scientificName.isNotEmpty &&
        zoneName.isNotEmpty&&kudu!=null) {
      print('All Ok');
      setState(() {
        initDescription = description;
        initAnimalName = animalName;
        asset = imagePath;
        initScientificName = scientificName;
        isKudu=kudu;
        audioPath=audioPath2;
      });

      // print(asset);
    } else
      print('Error getting details');
    _load();
    setState(() {
      isGettingDetails = false;
    });
  }

  Widget imageContainer({
    String assetsPath,
  }) {
    return Container(
      height: hDimen(100),
      width: hDimen(200),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(hDimen(25)),
        child: Image.asset(
          assetsPath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        vSpacing(hDimen(20)),
        // Padding(
        //   padding: EdgeInsets.only(right: hDimen(20)),
        //   child: Align(
        //     alignment: Alignment.topRight,
        //     child: CustomTextfieldWidget(
        //       isLebelTextNeeded: false,
        //       suffixIcon: Icon(
        //         Icons.search,
        //         color: Colors.black54,
        //       ),
        //       lebelHeight: hDimen(14),
        //       height: hDimen(50),
        //       width: hDimen(300),
        //       unSelectedColor: Color(0xFFe3e3e3),
        //       inputType: TextInputType.emailAddress,
        //       focusNode: nodeSearchAnimal,
        //       hintText: "Search by animal",
        //       textInputAction: TextInputAction.next,
        //       controller: controllerSearchAnimal,
        //       onSubmitted: (value) {
        //         nodeSearchAnimal.unfocus();
        //       },
        //     ),
        //   ),
        // ),
        vSpacing(30),
        zoneName.isNotEmpty ?
        GestureDetector(
          onTap: () {
            stop();
            widget.onZoneBack(widget.zoneIndex);
          },
          child: Padding(
            padding: EdgeInsets.only(left: hDimen(25)),
            child: Text(
              'Back to ' + zoneName,
              style: TextStyle(
                fontSize: hDimen(20),
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ):Container(),
        vSpacing(20),
        isGettingDetails
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.colorPrimary,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  hSpacing(20),
                  isKudu? Expanded(
                    child: Container(
                      color: Colors.transparent,
                      height: hDimen(600),
                      child: Card(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            hDimen(20),
                          ),
                        ),
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(hDimen(20)),
                          child: Image.asset(
                            asset,
                            fit: BoxFit.fill,

                          ),
                        ),
                      ),
                    ),
                  ): Expanded(
                    child: Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          hDimen(20),
                        ),
                      ),
                      elevation: 3,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(hDimen(20)),
                        child: Image.asset(
                          asset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  hSpacing(hDimen(20)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          initAnimalName,
                          style: TextStyle(
                            fontSize: hDimen(25),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        vSpacing(hDimen(10)),
                        Text(
                          ' ($initScientificName)',
                          style: TextStyle(
                            fontSize: hDimen(25),
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        vSpacing(hDimen(20)),
                        Text(
                          initDescription,
                          style: TextStyle(
                            fontSize: hDimen(20),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
        // vSpacing(hDimen(40)),
        // Container(
        //   // width: hDimen(550),
        //   height: hDimen(250),
        //   child: ListView.builder(
        //     padding: EdgeInsets.only(
        //       left: hDimen(25),
        //     ),
        //     scrollDirection: Axis.horizontal,
        //     physics: BouncingScrollPhysics(),
        //     itemCount: assetPaths.length,
        //     itemBuilder: (context, index) {
        //       return Padding(
        //         padding: EdgeInsets.only(
        //           right: hDimen(20),
        //         ),
        //         child: imageContainer(assetsPath: assetPaths[index]),
        //       );
        //     },
        //   ),
        // ),
        vSpacing(hDimen(20)),
      ],
    );
  }
}
