import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:museum_application/widgets/customTextfieldwidget.dart';

class SearchAnimal extends StatefulWidget {
  const SearchAnimal({Key key}) : super(key: key);

  @override
  _SearchAnimalState createState() => _SearchAnimalState();
}

class _SearchAnimalState extends State<SearchAnimal> {
  FocusNode nodeSearchAnimal = FocusNode();
  TextEditingController controllerSearchAnimal = TextEditingController();
  List<DropdownMenuItem> dropDownMenuItems = [];
  List<String> items = [
    "Zone Name",
    "Kajiranga",
    "Jaldapara",
    "Singalila",
    "Jim Corbett",
    "Nilgiris",
    "Bandipur",
    "Bhitarkanika",
    "Gir",
    "Kanha",
    "Sunderbans",
  ];

  @override
  void initState() {
    createMenuItem();
    super.initState();
  }

  void createMenuItem() {
    for (int i = 0; i < items.length; i++) {
      dropDownMenuItems.add(DropdownMenuItem(
        child: Text(items[i]),
        value: i,
      ));
    }
    print("DropDown items:$dropDownMenuItems");
  }

  Widget customDropDown() {
    return Container(
      height: hDimen(40),
      width: hDimen(140),
      child: DropdownButton(
        elevation: 0,
        underline: Container(),
        icon: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(
            Icons.keyboard_arrow_down,
            size: hDimen(30),
            color: Colors.black45,
          ),
        ),
        items: dropDownMenuItems,
        style: TextStyle(
          color: Colors.black87,
          fontSize: hDimen(16),
        ),
        hint: Text(
          "Zone Name",
          style: TextStyle(
            fontSize: hDimen(18),
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget prefixWidgetSearch() {
    return Container(
      width: hDimen(190),
      height: hDimen(80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              hSpacing(hDimen(5)),
              Icon(
                Icons.location_on,
                color: Colors.black87,
                size: hDimen(25),
              ),
              hSpacing(hDimen(5)),
              customDropDown(),
              hSpacing(hDimen(5)),
              Container(
                height: hDimen(50),
                child: VerticalDivider(
                  color: Colors.black45,
                  width: 2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget searchFieldButton() {
    return Padding(
      padding: EdgeInsets.only(right: hDimen(5)),
      child: Container(
        height: hDimen(40),
        width: hDimen(110),
        decoration: BoxDecoration(
          color: AppColor.colorSearchButton,
          borderRadius: BorderRadius.circular(hDimen(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: hDimen(25),
            ),
            hSpacing(hDimen(10)),
            Text(
              "FIND",
              style: TextStyle(
                color: Colors.white,
                fontSize: hDimen(18),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchField() {
    return Padding(
      padding: EdgeInsets.only(
        left: hDimen(20),
        right: hDimen(20),
      ),
      child: Container(
        height: hDimen(80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(hDimen(20)),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            prefixWidgetSearch(),
            hSpacing(hDimen(10)),
            Expanded(
              child: CustomTextfieldWidget(
                disableBorder: true,
                contentPadding: EdgeInsets.only(top: hDimen(50)),
                isLebelTextNeeded: false,
                lebelHeight: hDimen(14),
                height: hDimen(75),
                width: double.infinity,
                unSelectedColor: Colors.white,
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
            hSpacing(hDimen(5)),
            searchFieldButton(),
          ],
        ),
      ),
    );
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
    String zoneName,
    String animalName,
    String description,
    String assetsPath,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      zoneName,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: hDimen(18),
                      ),
                    ),
                    vSpacing(5),
                    Text(
                      animalName,
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: hDimen(20),
                      ),
                    ),
                  ],
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
                description,
                style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: hDimen(18),
                ),
              ),
            ),
            vSpacing(hDimen(20)),
            exploreButton(),
            vSpacing(hDimen(20)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          vSpacing(hDimen(50)),
          searchField(),
          vSpacing(hDimen(40)),
          Expanded(
            child: GridView(
              padding: EdgeInsets.only(
                left: hDimen(20),
                right: hDimen(20),
              ),
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  mainAxisSpacing: hDimen(20),
                  crossAxisSpacing: hDimen(20),
                  childAspectRatio: 0.9),
              children: [
                Expanded(
                  child: searchAnimalCard(
                    assetsPath: "assets/loggerhead.jpg",
                    description: "This is the description",
                    zoneName: "Bandipur",
                    animalName: "Turtle",
                  ),
                ),
                Expanded(
                  child: searchAnimalCard(
                    assetsPath: "assets/loggerhead.jpg",
                    description: "This is the description",
                    zoneName: "Bandipur",
                    animalName: "Turtle",
                  ),
                ),
                Expanded(
                  child: searchAnimalCard(
                    assetsPath: "assets/loggerhead.jpg",
                    description: "This is the description",
                    zoneName: "Bandipur",
                    animalName: "Turtle",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
