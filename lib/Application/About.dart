import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:museum_application/widgets/customTextfieldwidget.dart';
import 'package:path_provider/path_provider.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  FocusNode nodeSearchAnimal = FocusNode();
  TextEditingController controllerSearchAnimal = TextEditingController();

  String asset = "assets/about1.png";
  List<String> assetPaths = [
    'assets/about1.png',
    "assets/about2.png",
    "assets/about3.png",
    'assets/about4.png',
    'assets/about5.png',
    'assets/about6.png',
    'assets/about7.png',
  ];
  int indexImg = 0;

  String mp3Uri;

  AudioPlayer audioPlayer = AudioPlayer(
    mode: PlayerMode.MEDIA_PLAYER,
  );

  Future<Null> _load() async {
    final ByteData data = await rootBundle.load(
      'audio/Background.mp3',
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
  void initState() {
    _load();
    super.initState();
  }

  @override
  void dispose() {
    stop();
    super.dispose();
  }

  Widget imageContainer({
    String assetsPath,
    Function onTab,
  }) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        // height: hDimen(100),
        width: hDimen(100),
        color: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(hDimen(25)),
          child: Image.asset(
            assetsPath,
            fit: BoxFit.cover,
          ),
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
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hSpacing(20),
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                          hDimen(20),
                        ),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            hDimen(20),
                          ),
                        ),
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(hDimen(20)),
                          child: Image.asset(
                            assetPaths[indexImg],
                            // height: hDimen(209),
                            fit: BoxFit.cover,
                          ),
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
                              print(indexImg);
                              setState(() {
                                indexImg = (indexImg - 1) % assetPaths.length;
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
                              print(indexImg);
                              setState(() {
                                indexImg = (indexImg + 1) % assetPaths.length;
                              });
                              print(indexImg);
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
                      "About Keyah Grande",
                      style: TextStyle(
                        fontSize: hDimen(20),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    vSpacing(hDimen(10)),
                    Text(
                      "Keyah Grande is an exclusive luxury destination location. A private villa nested in the heart of Colorado's San Juan Mountains, surrounded by over 4000 acres of pristine, natural beauty and breathtaking views. Keyah Grande connects refined elegance with the rustic, natural elements of South west Colorado o bring guests an unmatched retreat destination perfect for any occasion!\n With its majestic views, beautiful decor, internationally inspired suites and wireless capabilities, Keyah Grande is the ideal destination for weddings, corporate events, reunions, family gatherings, wellness retreats, cowboy gatherings and so much more.\nKeyah Grande offers a wide array of activities both on and off the property. relax in our custom spa while enjoying a treatment or head down to the chuckwagon for a rustic cowboy dinner. If exploration of the property is what you are looking for, book a horseback ride around the ranch with beautiful photos ops all around Keyah Grande is a bucket list destination.",
                      style: TextStyle(
                        fontSize: hDimen(14),
                        color: Colors.black,
                      ),
                    ),
                    vSpacing(hDimen(10)),
                    Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: hDimen(16),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    vSpacing(hDimen(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black87,
                          size: hDimen(20),
                        ),
                        hSpacing(20),
                        Text(
                          "13211 W Hwy 160, Pagosa Springs, CO 81147",
                          style: TextStyle(
                            fontSize: hDimen(16),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    vSpacing(hDimen(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mail_outline_rounded,
                          color: Colors.black87,
                          size: hDimen(20),
                        ),
                        hSpacing(20),
                        Text(
                          "theguesthouse@gmail.com",
                          style: TextStyle(
                            fontSize: hDimen(16),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    vSpacing(hDimen(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.black87,
                          size: hDimen(25),
                        ),
                        hSpacing(20),
                        Text(
                          "970.731.1162",
                          style: TextStyle(
                            fontSize: hDimen(18),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        vSpacing(hDimen(10)),
        Container(
          // width: hDimen(550),
          height: hDimen(100),
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: hDimen(20),
            ),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: assetPaths.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: hDimen(20),
                ),
                child: imageContainer(
                  assetsPath: assetPaths[index],
                  onTab: (){
                    setState(() {
                      indexImg=index;
                    });
                  }
                ),
              );
            },
          ),
        ),
        vSpacing(hDimen(10)),
      ],
    );
  }
}
