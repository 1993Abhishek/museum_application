import 'package:flutter/material.dart';
import 'package:museum_application/Application/About.dart';
import 'package:museum_application/Application/SearchAnimal.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:museum_application/widgets/customTextfieldwidget.dart';

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


  // @override
  // void initState() {
  //
  //   super.initState();
  // }

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
  }) {
    return Container(
      height: hDimen(700),
      width: hDimen(500),
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
        child: Padding(
          padding: EdgeInsets.only(left: hDimen(10), right: hDimen(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              vSpacing(hDimen(10)),
              Center(
                child: Container(
                  height: hDimen(100),
                  width: hDimen(240),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(hDimen(25)),
                    child: Image.asset(
                      assetsPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              vSpacing(hDimen(20)),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: hDimen(20),
                ),
              ),
              vSpacing(hDimen(20)),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: hDimen(18),
                ),
              ),
              vSpacing(hDimen(20)),
              exploreButton(),
              vSpacing(hDimen(20)),
            ],
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
              fontSize: hDimen(20),
            ),
          ),
          vSpacing(hDimen(20)),
          Expanded(
            child: GridView(
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  mainAxisSpacing: hDimen(20),
                  crossAxisSpacing: hDimen(20),
                  childAspectRatio: 0.9),
              children: [
                homeCard(
                  assetsPath: "assets/loggerhead.jpg",
                  description: "This is the description",
                  title: "Zone Name Here",
                ),
                homeCard(
                  assetsPath: "assets/loggerhead.jpg",
                  description: "This is the description",
                  title: "Zone Name Here",
                ),
                homeCard(
                  assetsPath: "assets/loggerhead.jpg",
                  description: "This is the description",
                  title: "Zone Name Here",
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: hDimen(78),
            width: hDimen(230),
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
                Icon(
                  icon,
                  color: Colors.black,
                  size: hDimen(40),
                ),
                hSpacing(15),
                Text(
                  labelText,
                  style: TextStyle(
                    fontSize: hDimen(20),
                    color: Colors.black87,
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          isSelected ? semiCircle() : Container(),
        ],
      ),
    );
  }

  Widget semiCircle() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(0),
          height: hDimen(50),
          width: hDimen(20),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                hDimen(30),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(0),
          height: hDimen(50),
          width: hDimen(20),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(
                hDimen(30),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation= MediaQuery.of(context).orientation;
    print(deviceOrientation);
    return Scaffold(
      backgroundColor: AppColor.colorPrimary,
      body: OrientationBuilder(
        builder: (context, orientation) => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            hSpacing(hDimen(30)),
            Container(
              width: hDimen(250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  vSpacing(hDimen(50)),
                  Text(
                    "KEYAH GRANDE",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: hDimen(22),
                      letterSpacing: hDimen(2),
                    ),
                  ),
                  vSpacing(hDimen(40)),
                  drawerItem(
                    labelText: "Regional Zones",
                    isSelected: isHomeSelected,
                    icon: Icons.home,
                    onTap: () {
                      setState(() {
                        isHomeSelected = true;
                        isSearchAnimalSelected = false;
                        isMapSelected = false;
                        isAnimalSelected = false;
                        isAboutSelected = false;
                      });
                    },
                  ),
                  vSpacing(hDimen(20)),
                  drawerItem(
                    labelText: "Search Animals",
                    isSelected: isSearchAnimalSelected,
                    icon: Icons.search,
                    onTap: () {
                      setState(() {
                        isHomeSelected = false;
                        isSearchAnimalSelected = true;
                        isMapSelected = false;
                        isAnimalSelected = false;
                        isAboutSelected = false;
                      });
                    },
                  ),
                  vSpacing(hDimen(20)),
                  drawerItem(
                    labelText: "Map",
                    isSelected: isMapSelected,
                    icon: Icons.location_on,
                    onTap: () {
                      setState(() {
                        isHomeSelected = false;
                        isSearchAnimalSelected = false;
                        isMapSelected = true;
                        isAnimalSelected = false;
                        isAboutSelected = false;
                      });
                    },
                  ),
                  vSpacing(hDimen(20)),
                  drawerItem(
                    labelText: "Animals",
                    isSelected: isAnimalSelected,
                    icon: Icons.settings,
                    onTap: () {
                      setState(() {
                        isHomeSelected = false;
                        isSearchAnimalSelected = false;
                        isMapSelected = false;
                        isAnimalSelected = true;
                        isAboutSelected = false;
                      });
                    },
                  ),
                  vSpacing(hDimen(20)),
                  drawerItem(
                    labelText: "About Us",
                    isSelected: isAboutSelected,
                    icon: Icons.collections_bookmark_sharp,
                    onTap: () {
                      setState(() {
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
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: hDimen(20),
                  bottom: hDimen(20),
                  right: hDimen(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFf2f2f2),
                    borderRadius: BorderRadius.circular(hDimen(35)),
                  ),
                  child: isHomeSelected
                      ? homeWidget(
                          orientation: orientation,
                        )
                      : isSearchAnimalSelected
                          ? SearchAnimal()
                          : isAboutSelected
                              ? AboutUsScreen()
                              : Container(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
