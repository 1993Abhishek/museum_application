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

  const AnimalsScreen({Key key, this.onZoneBack}) : super(key: key);

  @override
  _AnimalsScreenState createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  String directory;
  List file = new List();

  FocusNode nodeSearchAnimal = FocusNode();
  TextEditingController controllerSearchAnimal = TextEditingController();
  String initDescription = '';
  String initAnimalName = '';

  String asset = "assets/loggerhead.jpg";
  List<String> assetPaths = [
    "assets/loggerhead.jpg",
    "assets/national_geographic1.jpg"
  ];
  int imageIndex = 0;
  bool isGettingDetails = false;
  String mp3Uri;

  AudioPlayer audioPlayer = AudioPlayer(
    mode: PlayerMode.MEDIA_PLAYER,
  );

  @override
  void initState() {
    getAnimalDetails();
    super.initState();
  }
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
  String audioPath='';

  void getAnimalDetails() async {
    setState(() {
      isGettingDetails = true;
    });
    String description =
        await SharedPreference.getStringPreference('description');
    String animalName = await SharedPreference.getStringPreference('name');
    String imagePath = await SharedPreference.getStringPreference('imgPath');
    audioPath = await SharedPreference.getStringPreference('audioPath');
    if (description.isNotEmpty &&
        animalName.isNotEmpty &&
        imagePath.isNotEmpty &&
        audioPath.isNotEmpty) {
      _load();
      setState(() {
        initDescription = description;
        initAnimalName = animalName;
        asset = imagePath;
      });

      // print(asset);
    } else
      print('Error getting details');
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
        Padding(
          padding: EdgeInsets.only(right: hDimen(20)),
          child: Align(
            alignment: Alignment.topRight,
            child: CustomTextfieldWidget(
              isLebelTextNeeded: false,
              suffixIcon: Icon(
                Icons.search,
                color: Colors.black54,
              ),
              lebelHeight: hDimen(14),
              height: hDimen(50),
              width: hDimen(300),
              unSelectedColor: Color(0xFFe3e3e3),
              inputType: TextInputType.emailAddress,
              focusNode: nodeSearchAnimal,
              hintText: "Search by animal",
              textInputAction: TextInputAction.next,
              controller: controllerSearchAnimal,
              onSubmitted: (value) {
                nodeSearchAnimal.unfocus();
              },
            ),
          ),
        ),
        vSpacing(30),
        GestureDetector(
          onTap:() {
            stop();
            widget.onZoneBack();
          },
          child: Padding(
            padding: EdgeInsets.only(left: hDimen(25)),
            child: Text(
              "Back To Zone Name",
              style: TextStyle(
                fontSize: hDimen(20),
                color: Colors.black,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
        vSpacing(20),
        isGettingDetails
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: AppColor.colorPrimary,
                ),
              )
            : Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hSpacing(20),
                    Expanded(
                      child: Stack(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(hDimen(20))),
                            elevation: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(hDimen(20)),
                              child: Image.asset(
                                asset,
                                // height: hDimen(209),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: hDimen(10),
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: hDimen(50),
                                width: hDimen(50),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: Colors.black45,
                                    size: hDimen(30),
                                  ),
                                  onPressed: () {
                                    print(imageIndex);
                                    setState(() {
                                      imageIndex =
                                          (imageIndex - 1) % assetPaths.length;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              right: hDimen(10),
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: hDimen(50),
                                width: hDimen(50),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: Colors.black45,
                                    size: hDimen(30),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      imageIndex =
                                          (imageIndex - 1) % assetPaths.length;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
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
              ),
        vSpacing(hDimen(40)),
        Container(
          // width: hDimen(550),
          height: hDimen(250),
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: hDimen(25),
            ),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: assetPaths.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: hDimen(20),
                ),
                child: imageContainer(assetsPath: assetPaths[index]),
              );
            },
          ),
        ),
        vSpacing(hDimen(85)),
      ],
    );
  }
}
