import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum_application/Application/About.dart';
import 'package:museum_application/Application/Animals.dart';
import 'package:museum_application/Application/SearchAnimal.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:museum_application/widgets/customTextfieldwidget.dart';
import 'package:museum_application/widgets/zone1_animals.dart';
import 'package:museum_application/widgets/zone2_animals.dart';
import 'package:museum_application/widgets/zone3_animals.dart';
import 'package:museum_application/widgets/zone4_animals.dart';
import 'package:museum_application/widgets/zone5_animals.dart';
import 'package:museum_application/widgets/zone6_animals.dart';
import 'package:museum_application/widgets/zone7_animal.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHomeSelected = true,
      isAnimalSelected = false,
      isAboutSelected = false,
      isMapSelected = false,
      isSearchAnimalSelected = false;

  FocusNode nodeSearchAnimal = FocusNode();
  TextEditingController controllerSearchAnimal = TextEditingController();

  bool isZone1Details = false,
      isZone2Details = false,
      isZone3Details = false,
      isZone4Details = false,
      isZone5Details = false,
      isZone6Details = false,
      isZone7Details = false;

  String mp3Uri;

  AudioPlayer audioPlayer = AudioPlayer(
    mode: PlayerMode.MEDIA_PLAYER,
  );

  Future _load() async {
    final ByteData data = await rootBundle.load(
      'audio/Background.mp3',
    );
    Directory tempDir = await getTemporaryDirectory();
    File tempFile = File('${tempDir.path}/background.mp3');
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
  void initState() {
    _load();
    super.initState();
  }

  @override
  void dispose() {
    stop();
    super.dispose();
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

  Widget homeCard({
    String title,
    String description,
    String assetsPath,
    Function onExtend,
    bool isZone6=false,
  }) {
    return GestureDetector(
      onTap: onExtend,
      child: Container(
        height: hDimen(400),
        child: Card(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    vSpacing(hDimen(10)),
                    isZone6 ? Container(
                      height: hDimen(200),
                      width: MediaQuery.of(context).size.width-20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(hDimen(25)),
                        child: Image.asset(
                          assetsPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ):Container(
                      height: hDimen(200),
                      width: MediaQuery.of(context).size.width-20,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(hDimen(25)),
                        child: Image.asset(
                          assetsPath,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    vSpacing(hDimen(15)),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: hDimen(20),
                      ),
                    ),
                    vSpacing(hDimen(15)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom:hDimen(15)),
                  child: GestureDetector(
                    child: exploreButton(),
                    onTap: onExtend,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homeWidget({
    Orientation orientation,
  }) {
    print(orientation);
    return Padding(
      padding: EdgeInsets.only(
        left: hDimen(30),
        right: hDimen(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          vSpacing(20),
          Align(
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
              unSelectedColor: Colors.grey[300],
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
          vSpacing(20),
          Text(
            "Browse By Zones",
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: hDimen(24),
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child: GridView(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: orientation == Orientation.landscape ? 3 : 2,
                mainAxisSpacing: hDimen(20),
                crossAxisSpacing: hDimen(20),
                childAspectRatio: 0.9,
              ),
              children: [
                homeCard(
                  assetsPath: "assets/Leopard.jpg",
                  description: "",
                  title: "African Diorama: Zone 1",
                  onExtend: () {
                    print("Zone 1 Tab");
                    setState(() {
                      isZone1Details = true;
                      isHomeSelected = false;
                      isSearchAnimalSelected = false;
                      isMapSelected = false;
                      isAnimalSelected = false;
                      isAboutSelected = false;
                    });
                  },
                ),
                homeCard(
                  onExtend: () {
                    setState(() {
                      isZone2Details = true;
                      isHomeSelected = false;
                      isSearchAnimalSelected = false;
                      isMapSelected = false;
                      isAnimalSelected = false;
                      isAboutSelected = false;
                    });
                  },
                  assetsPath: "assets/Konya Sheep.jpg",
                  description: "This is the description",
                  title: "Mountain: Zone 2",
                ),
                homeCard(
                  assetsPath: "assets/Polar Bear.jpg",
                  description: "This is the description",
                  title: "Cave: Zone 3",
                  onExtend: () {
                    setState(() {
                      isZone3Details = true;
                      isHomeSelected = false;
                      isSearchAnimalSelected = false;
                      isMapSelected = false;
                      isAnimalSelected = false;
                      isAboutSelected = false;
                    });
                  },
                ),
                homeCard(
                  assetsPath: "assets/Zebra Duiker.jpg",
                  description: "This is the description",
                  title: 'Jungle: Zone 4',
                  onExtend: () {
                    setState(() {
                      isZone4Details = true;
                      isHomeSelected = false;
                      isSearchAnimalSelected = false;
                      isMapSelected = false;
                      isAnimalSelected = false;
                      isAboutSelected = false;
                    });
                  },
                ),
                homeCard(
                  assetsPath: "assets/Musk Deer.jpg",
                  description: "This is the description",
                  title: 'Stairway Cover: Zone 5',
                  onExtend: () {
                    setState(() {
                      isZone5Details = true;
                      isHomeSelected = false;
                      isSearchAnimalSelected = false;
                      isMapSelected = false;
                      isAnimalSelected = false;
                      isAboutSelected = false;
                    });
                  },
                ),
                homeCard(
                  assetsPath: "assets/Wood Bison.jpg",
                  description: "This is the description",
                  title: 'Mezzanine: Zone 6',
                  isZone6: true,
                  onExtend: () {
                    setState(() {
                      isZone6Details = true;
                      isHomeSelected = false;
                      isSearchAnimalSelected = false;
                      isMapSelected = false;
                      isAnimalSelected = false;
                      isAboutSelected = false;
                    });
                  },
                ),
                homeCard(
                  assetsPath: "assets/Lord Derby Eland.jpg",
                  description: "This is the description",
                  title: 'Old Trophy Room: Zone 7',
                  onExtend: () {
                    setState(() {
                      isZone7Details = true;
                      isHomeSelected = false;
                      isSearchAnimalSelected = false;
                      isMapSelected = false;
                      isAnimalSelected = false;
                      isAboutSelected = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem({
    String labelText,
    String assetPath,
    bool isSelected,
    Function onTap,
    IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: hDimen(78),
              // width: hDimen(230),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFFf2f2f2) : AppColor.colorPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(
                    hDimen(50),
                    hDimen(50),
                  ),
                  topLeft: Radius.elliptical(
                    hDimen(50),
                    hDimen(50),
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hSpacing(hDimen(15)),
                  assetPath == null
                      ? Icon(
                          icon,
                          color: Colors.black,
                          size: hDimen(40),
                        )
                      : Container(
                          height: hDimen(25),
                          width: hDimen(25),
                          child: Image.asset(
                            assetPath,
                            fit: BoxFit.cover,
                          ),
                        ),
                  hSpacing(15),
                  Text(
                    labelText,
                    style: TextStyle(
                      fontSize: hDimen(18),
                      color: Colors.black87,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          isSelected
              ? ClipPath(
                  child: Container(
                    height: hDimen(150),
                    width: hDimen(45),
                    color:
                        isSelected ? Color(0xFFf2f2f2) : AppColor.colorPrimary,
                  ),
                  clipper: CustomCLip(),
                )
              : Container(),
        ],
      ),
    );
  }

  int zoneIndex = 0;

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation = MediaQuery.of(context).orientation;
    print(deviceOrientation);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: AppColor.colorPrimary,
      body: OrientationBuilder(
        builder: (context, orientation) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hSpacing(hDimen(30)),
            Container(
              width: hDimen(250),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    vSpacing(hDimen(25)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "KEYAH",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: hDimen(20),
                                letterSpacing: hDimen(3),
                              ),
                            ),
                            Container(
                              height: hDimen(50),
                              width: hDimen(45),
                              child: Image.asset(
                                "assets/feather2.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              "GRANDE",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: hDimen(20),
                                letterSpacing: hDimen(3),
                              ),
                            ),
                          ],
                        ),
                        vSpacing(hDimen(40)),
                        drawerItem(
                          assetPath: "assets/Regional Zones.png",
                          labelText: "Regional Zones",
                          isSelected: isHomeSelected,
                          icon: Icons.home,
                          onTap: () {
                            setState(() {
                              isZone1Details = false;
                              isZone2Details = false;
                              isZone3Details = false;
                              isZone4Details = false;
                              isZone5Details = false;
                              isZone6Details = false;
                              isZone7Details = false;
                              isHomeSelected = true;
                              isSearchAnimalSelected = false;
                              isMapSelected = false;
                              isAnimalSelected = false;
                              isAboutSelected = false;
                            });
                          },
                        ),
                        // vSpacing(hDimen(20)),
                        drawerItem(
                          assetPath: "assets/Search Animals.png",
                          labelText: "Search Animals",
                          isSelected: isSearchAnimalSelected,
                          icon: Icons.search,
                          onTap: () {
                            setState(() {
                              isZone1Details = false;
                              isZone2Details = false;
                              isZone3Details = false;
                              isZone4Details = false;
                              isZone5Details = false;
                              isZone6Details = false;
                              isZone7Details = false;
                              isHomeSelected = false;
                              isSearchAnimalSelected = true;
                              isMapSelected = false;
                              isAnimalSelected = false;
                              isAboutSelected = false;
                            });
                          },
                        ),
                        // vSpacing(hDimen(20)),
                        drawerItem(
                          assetPath: "assets/Map.png",
                          labelText: "Map",
                          isSelected: isMapSelected,
                          icon: Icons.location_on,
                          onTap: () {
                            setState(() {
                              isZone1Details = false;
                              isZone2Details = false;
                              isZone3Details = false;
                              isZone4Details = false;
                              isZone5Details = false;
                              isZone6Details = false;
                              isZone7Details = false;
                              isHomeSelected = false;
                              isSearchAnimalSelected = false;
                              isMapSelected = true;
                              isAnimalSelected = false;
                              isAboutSelected = false;
                            });
                          },
                        ),
                        // vSpacing(hDimen(20)),
                        drawerItem(
                          assetPath: "assets/Animals.png",
                          labelText: "Animals",
                          isSelected: isAnimalSelected,
                          icon: Icons.settings,
                          onTap: () {
                            setState(() {
                              isZone1Details = false;
                              isZone2Details = false;
                              isZone3Details = false;
                              isZone4Details = false;
                              isZone5Details = false;
                              isZone6Details = false;
                              isZone7Details = false;
                              isHomeSelected = false;
                              isSearchAnimalSelected = false;
                              isMapSelected = false;
                              isAnimalSelected = true;
                              isAboutSelected = false;
                            });
                          },
                        ),
                        // vSpacing(hDimen(20)),
                        drawerItem(
                          assetPath: "assets/About Us.png",
                          labelText: "About Us",
                          isSelected: isAboutSelected,
                          icon: Icons.collections_bookmark_sharp,
                          onTap: () {
                            setState(() {
                              isZone1Details = false;
                              isZone2Details = false;
                              isZone3Details = false;
                              isZone4Details = false;
                              isZone5Details = false;
                              isZone6Details = false;
                              isZone7Details = false;
                              isHomeSelected = false;
                              isSearchAnimalSelected = false;
                              isMapSelected = false;
                              isAnimalSelected = false;
                              isAboutSelected = true;
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                      width: hDimen(150),
                      height: hDimen(150),
                      child: Image.asset(
                        "assets/feather1.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: hDimen(30),
                        bottom: hDimen(20),
                      ),
                      child: Text(
                        "Copyright 2021",
                        style: TextStyle(
                          fontSize: hDimen(15),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFf2f2f2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(hDimen(40)),
                    bottomLeft: Radius.circular(hDimen(40)),
                  ),
                ),
                child: isZone7Details
                    ? Zone7Animals(
                        onExpand: (value) {
                          setState(() {
                            zoneIndex = value;
                            isZone1Details = false;
                            isZone2Details = false;
                            isZone3Details = false;
                            isZone4Details = false;
                            isZone5Details = false;
                            isZone6Details = false;
                            isZone7Details = false;
                            isHomeSelected = false;
                            isSearchAnimalSelected = false;
                            isMapSelected = false;
                            isAnimalSelected = true;
                            isAboutSelected = false;
                          });
                        },
                      )
                    : isZone6Details
                        ? Zone6Animals(
                            onExpand: (value) {
                              setState(() {
                                zoneIndex = value;
                                isZone1Details = false;
                                isZone2Details = false;
                                isZone3Details = false;
                                isZone4Details = false;
                                isZone5Details = false;
                                isZone6Details = false;
                                isZone7Details = false;
                                isHomeSelected = false;
                                isSearchAnimalSelected = false;
                                isMapSelected = false;
                                isAnimalSelected = true;
                                isAboutSelected = false;
                              });
                            },
                          )
                        : isZone5Details
                            ? Zone5Animals(
                                onExpand: (value) {
                                  setState(() {
                                    zoneIndex = value;
                                    isZone1Details = false;
                                    isZone2Details = false;
                                    isZone3Details = false;
                                    isZone4Details = false;
                                    isZone5Details = false;
                                    isZone6Details = false;
                                    isZone7Details = false;
                                    isHomeSelected = false;
                                    isSearchAnimalSelected = false;
                                    isMapSelected = false;
                                    isAnimalSelected = true;
                                    isAboutSelected = false;
                                  });
                                },
                              )
                            : isZone4Details
                                ? Zone4Animals(
                                    onExpand: (value) {
                                      setState(() {
                                        zoneIndex = value;
                                        isZone1Details = false;
                                        isZone2Details = false;
                                        isZone3Details = false;
                                        isZone4Details = false;
                                        isZone5Details = false;
                                        isZone6Details = false;
                                        isZone7Details = false;
                                        isHomeSelected = false;
                                        isSearchAnimalSelected = false;
                                        isMapSelected = false;
                                        isAnimalSelected = true;
                                        isAboutSelected = false;
                                      });
                                    },
                                  )
                                : isZone3Details
                                    ? Zone3Animals(
                                        onExpand: (value) {
                                          setState(() {
                                            zoneIndex = value;
                                            isZone1Details = false;
                                            isZone2Details = false;
                                            isZone3Details = false;
                                            isZone4Details = false;
                                            isZone5Details = false;
                                            isZone6Details = false;
                                            isZone7Details = false;
                                            isHomeSelected = false;
                                            isSearchAnimalSelected = false;
                                            isMapSelected = false;
                                            isAnimalSelected = true;
                                            isAboutSelected = false;
                                          });
                                        },
                                      )
                                    : isZone2Details
                                        ? Zone2Animals(
                                            onExpand: (value) {
                                              setState(() {
                                                zoneIndex = value;
                                                isZone1Details = false;
                                                isZone2Details = false;
                                                isZone3Details = false;
                                                isZone4Details = false;
                                                isZone5Details = false;
                                                isZone6Details = false;
                                                isZone7Details = false;
                                                isHomeSelected = false;
                                                isSearchAnimalSelected = false;
                                                isMapSelected = false;
                                                isAnimalSelected = true;
                                                isAboutSelected = false;
                                              });
                                            },
                                          )
                                        : isZone1Details
                                            ? Zone1Animals(
                                                onExpand: (value) {
                                                  print(value);
                                                  setState(() {
                                                    zoneIndex = value;
                                                    isZone1Details = false;
                                                    isZone2Details = false;
                                                    isZone3Details = false;
                                                    isZone4Details = false;
                                                    isZone5Details = false;
                                                    isZone6Details = false;
                                                    isZone7Details = false;
                                                    isHomeSelected = false;
                                                    isSearchAnimalSelected =
                                                        false;
                                                    isMapSelected = false;
                                                    isAnimalSelected = true;
                                                    isAboutSelected = false;
                                                  });
                                                },
                                              )
                                            : isHomeSelected
                                                ? homeWidget(
                                                    orientation: orientation,
                                                  )
                                                : isSearchAnimalSelected
                                                    ? SearchAnimal(
                                                        onExpand: (
                                                            /*description,animalName,animalImage*/) {
                                                          print('selected');
                                                          // print('Dashboard:$animalName');
                                                          setState(() {
                                                            isZone1Details =
                                                                false;
                                                            isZone2Details =
                                                                false;
                                                            isZone3Details =
                                                                false;
                                                            isZone4Details =
                                                                false;
                                                            isZone5Details =
                                                                false;
                                                            isZone6Details =
                                                                false;
                                                            isZone7Details =
                                                                false;
                                                            isHomeSelected =
                                                                false;
                                                            isSearchAnimalSelected =
                                                                false;
                                                            isMapSelected =
                                                                false;
                                                            isAnimalSelected =
                                                                true;
                                                            isAboutSelected =
                                                                false;
                                                          });
                                                        },
                                                      )
                                                    : isAboutSelected
                                                        ? AboutUsScreen()
                                                        : isAnimalSelected
                                                            ? AnimalsScreen(
                                                                zoneIndex:
                                                                    zoneIndex,
                                                                onZoneBack:
                                                                    (value) {
                                                                  print(value);
                                                                  if (value ==
                                                                      1) {
                                                                    setState(
                                                                        () {
                                                                      isZone1Details =
                                                                          true;
                                                                      isZone2Details =
                                                                      false;
                                                                      isZone3Details =
                                                                      false;
                                                                      isZone4Details =
                                                                      false;
                                                                      isZone5Details =
                                                                      false;
                                                                      isZone6Details =
                                                                      false;
                                                                      isZone7Details =
                                                                      false;
                                                                      isHomeSelected =
                                                                      false;
                                                                      isSearchAnimalSelected =
                                                                      false;
                                                                      isMapSelected =
                                                                      false;
                                                                      isAnimalSelected =
                                                                      false;
                                                                      isAboutSelected =
                                                                      false;
                                                                    });
                                                                  }
                                                                  if (value ==
                                                                      2) {
                                                                    setState(
                                                                        () {
                                                                      isZone2Details =
                                                                          true;
                                                                      isZone1Details =
                                                                      false;
                                                                      isZone3Details =
                                                                      false;
                                                                      isZone4Details =
                                                                      false;
                                                                      isZone5Details =
                                                                      false;
                                                                      isZone6Details =
                                                                      false;
                                                                      isZone7Details =
                                                                      false;
                                                                      isHomeSelected =
                                                                      false;
                                                                      isSearchAnimalSelected =
                                                                      false;
                                                                      isMapSelected =
                                                                      false;
                                                                      isAnimalSelected =
                                                                      false;
                                                                      isAboutSelected =
                                                                      false;
                                                                    });
                                                                  }
                                                                  if (value ==
                                                                      3) {
                                                                    setState(() {
                                                                      isZone1Details =
                                                                      false;
                                                                      isZone2Details =
                                                                      false;
                                                                      isZone3Details =
                                                                      true;
                                                                      isZone4Details =
                                                                      false;
                                                                      isZone5Details =
                                                                      false;
                                                                      isZone6Details =
                                                                      false;
                                                                      isZone7Details =
                                                                      false;
                                                                      isHomeSelected =
                                                                      false;
                                                                      isSearchAnimalSelected =
                                                                      false;
                                                                      isMapSelected =
                                                                      false;
                                                                      isAnimalSelected =
                                                                      false;
                                                                      isAboutSelected =
                                                                      false;
                                                                    });
                                                                  }
                                                                  if (value ==
                                                                      4) {
                                                                    setState(() {
                                                                      isZone1Details =
                                                                      false;
                                                                      isZone2Details =
                                                                      false;
                                                                      isZone3Details =
                                                                      false;
                                                                      isZone4Details =
                                                                      true;
                                                                      isZone5Details =
                                                                      false;
                                                                      isZone6Details =
                                                                      false;
                                                                      isZone7Details =
                                                                      false;
                                                                      isHomeSelected =
                                                                      false;
                                                                      isSearchAnimalSelected =
                                                                      false;
                                                                      isMapSelected =
                                                                      false;
                                                                      isAnimalSelected =
                                                                      false;
                                                                      isAboutSelected =
                                                                      false;
                                                                    });
                                                                  }
                                                                  if (value ==
                                                                      5) {
                                                                    setState(() {
                                                                      isZone1Details =
                                                                      false;
                                                                      isZone2Details =
                                                                      false;
                                                                      isZone3Details =
                                                                      false;
                                                                      isZone4Details =
                                                                      false;
                                                                      isZone5Details =
                                                                      true;
                                                                      isZone6Details =
                                                                      false;
                                                                      isZone7Details =
                                                                      false;
                                                                      isHomeSelected =
                                                                      false;
                                                                      isSearchAnimalSelected =
                                                                      false;
                                                                      isMapSelected =
                                                                      false;
                                                                      isAnimalSelected =
                                                                      false;
                                                                      isAboutSelected =
                                                                      false;
                                                                    });
                                                                  }
                                                                  if (value ==
                                                                      6) {
                                                                    setState(() {
                                                                      isZone1Details =
                                                                      false;
                                                                      isZone2Details =
                                                                      false;
                                                                      isZone3Details =
                                                                      false;
                                                                      isZone4Details =
                                                                      false;
                                                                      isZone5Details =
                                                                      false;
                                                                      isZone6Details =
                                                                      true;
                                                                      isZone7Details =
                                                                      false;
                                                                      isHomeSelected =
                                                                      false;
                                                                      isSearchAnimalSelected =
                                                                      false;
                                                                      isMapSelected =
                                                                      false;
                                                                      isAnimalSelected =
                                                                      false;
                                                                      isAboutSelected =
                                                                      false;
                                                                    });
                                                                  }
                                                                  if (value ==
                                                                      7) {
                                                                    setState(() {
                                                                      isZone1Details =
                                                                      false;
                                                                      isZone2Details =
                                                                      false;
                                                                      isZone3Details =
                                                                      false;
                                                                      isZone4Details =
                                                                      false;
                                                                      isZone5Details =
                                                                      false;
                                                                      isZone6Details =
                                                                      false;
                                                                      isZone7Details =
                                                                      true;
                                                                      isHomeSelected =
                                                                      false;
                                                                      isSearchAnimalSelected =
                                                                      false;
                                                                      isMapSelected =
                                                                      false;
                                                                      isAnimalSelected =
                                                                      false;
                                                                      isAboutSelected =
                                                                      false;
                                                                    });
                                                                  }

                                                                },
                                                              )
                                                            : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCLip extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.relativeMoveTo(0, size.height * 0.24);
    path.quadraticBezierTo(
        size.width * 0.77, size.height * 0.24, size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        size.width * .75, size.height * 0.78, 0, size.height * 0.765);
    path.close();
    return path;
  }
}
