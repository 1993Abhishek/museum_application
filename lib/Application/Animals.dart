import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:museum_application/widgets/customTextfieldwidget.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({Key key}) : super(key: key);

  @override
  _AnimalsScreenState createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  FocusNode nodeSearchAnimal = FocusNode();
  TextEditingController controllerSearchAnimal = TextEditingController();

  String asset = "assets/loggerhead.jpg";
  List<String> assetPaths = [
    "assets/loggerhead.jpg",
    "assets/national_geographic1.jpg"
  ];

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
          asset == null ? assetsPath : asset,
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
        vSpacing(20),
        Padding(
          padding: EdgeInsets.only(left:hDimen(15)),
          child: Text("Back To Zone Name",style: TextStyle(
            fontSize: hDimen(20),
            color: Colors.black,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),),
        ),
        vSpacing(20),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              hSpacing(10),
              Expanded(
                child:Stack(
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: assetPaths.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(hDimen(20))),
                        elevation: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(hDimen(20)),
                          child: Image.asset(
                            assetPaths[index],
                            // height: hDimen(209),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:hDimen(10),),
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
                              // print(index);
                              // setState(() {
                              //   index--;
                              // });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right:hDimen(10),),
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
                              // print(index);
                              // setState(() {
                              //   index=index+1;
                              // });
                              // print(index);
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
                        fontSize: hDimen(25),
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    vSpacing(hDimen(20)),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: hDimen(16),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        vSpacing(hDimen(20)),
        Container(
          // width: hDimen(550),
          height: hDimen(250),
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
                child: imageContainer(assetsPath: assetPaths[index]),
              );
            },
          ),
        ),
        vSpacing(hDimen(10)),
      ],
    );
  }
}
