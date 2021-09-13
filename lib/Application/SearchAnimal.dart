import 'dart:convert';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:museum_application/helper/appcolor.dart';
import 'package:museum_application/helper/shared_preference_service.dart';
import 'package:museum_application/utility/app_dimen.dart';
import 'package:museum_application/utility/appview_helper.dart';
import 'package:museum_application/widgets/customTextfieldwidget.dart';
import 'package:path_provider/path_provider.dart';

class SearchAnimal extends StatefulWidget {
  final Function onExpand;

  const SearchAnimal({
    Key key,
    this.onExpand,
  }) : super(key: key);

  @override
  _SearchAnimalState createState() => _SearchAnimalState();
}

class _SearchAnimalState extends State<SearchAnimal> {
  FocusNode nodeSearchAnimal = FocusNode();
  TextEditingController controllerSearchAnimal = TextEditingController();
  List<DropdownMenuItem> dropDownMenuItems = [];

  List<String> animalImagesZone1 = [
    'assets/Leopard.jpg',
    'assets/Greater Kudu.jpg',
    'assets/Sable .jpg',
    'assets/Uganda Kob.jpg',
    'assets/Jackson Hartebeeste.jpg',
    'assets/Gerenuk .jpg',
    'assets/Korrigum.jpg',
    'assets/Wild Dog.jpg',
    'assets/aardwolf.jpg',
    'assets/Patas Monkey.jpg',
  ];
  List<String> animalNamesZone1 = [
    'Leopard',
    'Greater Kudu',
    'Sable',
    'Uganda Kob',
    'Jackson Hartebeest',
    'Gerenuk',
    'Korrigum',
    'Wild Dog',
    'Aardwolf',
    'Patas Monkey',
  ];
  List<String> descriptionsZone1 = [
    'The Leopard has a very large distribution throughout central and southern Africa, with 12 known subspecies. As largely solitary animals, they are known to be nocturnal in their hunting. With some of their best senses being smell and hearing, these cats are very wary. The largest specimens can weigh over 170 pounds and live from 10 to 15 years.',
    'The Greater Kudu, which has 7 different subspecies, and the Lesser Kudu have a vast range and can be found throughout eastern, central and southern Africa. They can be solitary animals or live in small groups.  Of the Spiral Horn of Africa, they are second only to the Eland. They are well known as the “grey ghost” as their grey and stipped hair is perfect camouflage for the savanna and mountain terrain. In addition to the Kudu, there are 26 Spiral Horn Antelope subspecies in Africa.',
    'there are three main species of Sable, all located in eastern to southern Africa. These majestic animals are in the same family as the Roan (Hippotragus). Sable live in the savanna woodland and grasslands. They are largely herd animals, but when their numbers get larger it is common for small male bachelor groups to form. These large Bovines can weigh upwards of 500 poundsand live to 15 years old.',
    'Kob are found in the remote areas of Africa, ranging from Uganda to the Sudan. There are two main species of Kob: Uganda and White-eared, both in the Ringed Horn antelope family. Large herds can be found numbering in the thousands, but they can also be found in smaller numbers. Large males can weigh up to 200 pounds and live to be 17 years old.',
    'Hartebeeste, also known as, Kongoni, have 8 direct subspecies. Their distribution is from Western Africa all the way east to Tanzania, then south throughout southern Africa. As herd animals, they can be found in dry grasslands, wooded grasslands and open plains in search of suitable vegetation. Hartebeest are in the genus Alcelaphus, weighing up to 350 pounds and living to 12-15 years old.',
    'These unique animals are also called the “giraffe gazelle” and find their home in the drier ranges of East Africa. There are two different subspecies of Gerenuk: Northern and Southern. The Northern Gerenuk is found in regions of Ethiopia and Somalia, and the Southern is found in Tanzania and Kenya. They are the only species in the genus Litocranius and can live up to 8 years old. It is considered one of the Ringed Horn Animals.',
    'Korrigum, also known as the Senegal Hartebeeste, is part of the Topi family. Also referred to as the “Giant Topi,” they are currently found throughout Chad, although they were once found in Senegal (from where they are now extinct). These animals are often found in groups of 15 to 30, but you can also find them migrating in groups numbering in the thousands. They can live up to 15 years old.',
    'These very social pack animals have many different names: hunting dogs, painted hunting dogs, painted dogs and painted Lycaon.  Scientists now are pushing to rebrand this species as the “painted wolf,” as the name wild dog can have a negative connotation for the species. Their packs have a distinct hierarchy and can have upwards of 20-30 members per pack plus pups. Each member has a distinct role. Their range is mainly through sub-Saharan Africa: Ethiopia, Tanzania and Kenya, as well as southern Africa, Botswana, Namibia, Zimbabwe, and South Africa. They can live up to 12 years, with the average span being 5 to 7 years.',
    'The Aardwolf is the smallest species in the family Hyaenidae and is insectivorous. The name Aardwolf means “Earth-Wolf” in Afrikaans. The territory of the species is vast as their preferred food source, termites, can be found in many areas; this species has range in Northern, Southern, and Eastern Africa, where there are grasslands and savannas. These solitary, nocturnal animalscan live up to 12 years old.',
    'This ground dwelling monkey has a territory that ranges from Central West Africa through Central East Africa. Within their range, they are broken down into two species: Eastern and Western Patas Monkey. These species of monkey live in semi-arid terrain, living in groups upwards of sixty individuals. They are considered to be the only member of the genus Erythrocebus and can live to 20 years old.',
  ];

  List<String> scientificNamesZone1 = [
    'Panthera pardus pardus',
    'Tragelaphus strepsciceros',
    'Martes zibellina',
    'Kobus kob thomasi',
    'Alcelaphs buselaphus',
    'Litocranius walleri',
    'Damaliscus lanatus korrigum',
    'Lycaon pictus',
    'Proteles cristata',
    'Erythrocebus patas',
  ];

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
    'Urials / Mouflon:\nKonya Sheep',
    'North American:\nTexas Bighorn',
    'Markhor',
    'Ibex: Mid-Asian',
    'Goats: Himalayan Tahr',
  ];
  List<String> descriptionsZone2 = [
    'Argali are the largest of the wild sheep species in the world, with the largest argali subspecies found in Mongolia. The word Argali is the Mongol word meaning Wild Sheep. These sheep live in elevations ranging from 1,000 – 19,000 feet. Their horns can weigh as much as 50 pounds and reach over 60 inches in length.  Argali are also the largest bodied of the ovis family: they can be 200 pounds and can live up to 13 years old.',
    'Urials have 9 different direct subspecies and are closely related the Mouflon family.  Some scientists say they should all be classified in one genus. These sheep are the smallest subspecies of ovis living throughout Asia, mostly in the arid countries of Pakistan, Iran, Afghanistan, Uzbekistan, and Tajikistan. Large rams would top the scales at 110 pounds. These sheep can live up to 13,000 feet in elevation.',
    'There are 4 main species of sheep that make up the North American Grand Slam: Desert Bighorn, Rocky Mountain Bighorn, Dall Sheep and Stone Sheep. There are different subspecies of Desert Bighorn that range from the southern United States through Mexico. The Texas Bighorn, or Nelson Bighorn, is found in pockets of west and south Texas. There is a large conservation effort to help bring these iconic sheep back to their home range. Throughout the US, many conservation organizations are helping introduce and manage bighorns in their home ranges: from the west through the Midwest. A large ram’s horns will weigh up to thirty pounds.',
    'There are 5 main subspecies of Markhor that are found in Tajikistan, Afghanistan, Pakistan, and India, living upwards of 12,000 feet.  Markhor are all in the genus Capra subspecies Capriae. There is a large conservation effort in their home ranges to emphasize the importance of these animals with the local people and governments. Without conservation these animals are poached because it is said their horns have healing properties.',
    'there are 16 huntable species of Ibex from Europe to Asia. The Mid-Asian Ibex from Tajikistan is the largest subspecies that can have horns over 45 inches and weigh 300 pounds. The smallest subspecies is native to Greece and tips the scales at 100 pounds.',
    'One of the most iconic of the Capra species, Tahr is known for its big mane that gets long and dense in the winter extending from its neck through its shoulders. These animals can be found in their native range Nepal, as well as in their introduced home of New Zealand. The New Zealand Tahr is a self-sustaining wild population. They can be found living upwards of 16,000 feet.'
  ];
  List<String> scientificNamesZone2 = [
    'ovis ammon',
    'Ovis orientalis anatolica',
    'Ovis canadensis nelson',
    'Capra falconeri',
    'Capra sibirca',
    'Hemitragus jemlahicus',
  ];

  List<String> animalImagesZone3 = ['assets/Polar Bear.jpg'];
  List<String> animalNamesZone3 = ['Bears: Polar Bear'];
  List<String> descriptionsZone3 = [
    'Polar Bears are the largest land predators in the world and can weigh over 1,300 pounds. Polar bears or white bears are found in the arctic of North America, as well\nas Eurasia. Adapted to life on the ice as well as the mainland, they are a top predator wherever\nthey are found. These bears have adapted to life in the artic very well: they have black skin\nto absorb the sun, wide feet to help walk on snow as well as swim, and 3 eyelids to help\nprotect their eyes from the elements.  Their closest relative is the Alaskan Brown Bear.',
  ];
  List<String> scientificNamesZone3 = [
    'Ursus maritimus',
  ];

  List<String> animalImagesZone4 = [
    'assets/Zebra Duiker.jpg',
    'assets/Aders Duiker.jpg',
    'assets/Royal Antelope .jpg',
    'assets/Bongo.jpg',
    'assets/Nile Buffalo.jpg',
    'assets/Giant Forest Hog.jpg',
    'assets/Brocket Deer.jpg'
  ];
  List<String> animalNamesZone4 = [
    'Duiker: Zebra Duiker',
    'Duiker: Aders',
    'Royal Antelope',
    'Bongo',
    'Nile Buffalo',
    'Giant Forest Hog',
    'Brocket Deer',
  ];
  List<String> descriptionsZone4 = [
    'The Zebra Duiker has many different names depending on where you find them: Zebra Duiker, Zebra Antelope, Banded Duiker, Striped Duiker, Marked Deer or Mountain Deer. They live in the dense rainforests of Sierra Leone, Libera and the Southwest Ivory Coast. Like their name suggests, they have very distinguishable striped markings ranging from 12-16 stripes. They are very wary animals that are rarely seen with diurnal habits.',
    'Once thought to be a subspecies of the Harvey’s Duiker or the Peters Duiker, Aders are now considered to be their own species. Native to coastal forests on the coast of Kenya, they also have a strong population in Zanzibar. Aders have notable white markings on their legs and lower body.  These duikers are very secretive and alert, making them extremely elusive and rarely seen with diurnal habits.',
    'Royal Antelope are the smallest antelope in the world. Weighing in at 4-6 pounds and 10 inches at the shoulder, and living in dense forests, these animals are extremely alert and wary.  Their size and habitat, paired with their mostly nocturnal tendencies, make them very rarely seen. Found from Guinea to Gana, they have developed several names with the locals, including King of Hares, which led to their name the Royal Antelope, as well as Tricky-Jack and Jackrabbit.',
    'The Bongo is one of the larger species in the Spiral Horn family, second to the Eland and Kudu. Bongo have an auburn or chestnut color with 10 to 15 stripes, allowing them to blend into the dense forest well. With a good sense of hearing and a nervous temperament, Bongo are wary animals and are difficult to find. The Eastern Bongo are found in regions in the Central African Republic and the Congo, and the Western Bongo are found mainly in the forests of Sierra Leone.',
    'Nile buffalo are cousins to the well-known Cape Buffalo. A distinct characteristic that separates the two is how the Nile Buffalo’s horns do not dip below the skull line. Native to parts of the Sudan, Ethiopia, Congo and Uganda, these buffalo are herd animals and can be aggressive when provoked.',
    'Giant Forest Hogs or Forest Hogs are the largest swine in the world. With large, pronounced heads, characteristically loud grunting, growling and squealing, and giant warty growths under their eyes, they live in lowland marshes to as high as 13,000 feet in dense forests. They are primarily nocturnal, but in places with limited pressure they can be increasingly diurnal. Living in small groups of 4-15, they are found in regions of Nigeria, Cameroon, Gabon, Central African Republic, Congo, Sudan, Uganda, Ethiopia, Kenya and Tanzania.',
    'There are three main species of Brocket Deer, with several subspecies of each: the Red, Grey-Brown and the Yucatan Grey-Brown Brocket Deer. These deer live in savannas, forest edges and rainforests, with some of the subspecies also living in Central and South America, the Yucatan peninsula and the island of Trinidad. Primarily nocturnal and shy, it is difficult to find all species of Brocket Deer.',
  ];

  List<String> scientificNamesZone4 = [
    'Cephalophus zebra',
    'Cephalophus adersi',
    'Neotragus pygmaeus',
    'Tragelphus euycerus',
    'Synverus caffer aequicocialis',
    'Hylocherus meinertzageni',
    'Mazama americana',
  ];

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
    'Native to Mongolia, these deer have no antlers but large canines that look like fangs. The have also adapted longer hooves that allow them to climb trees to forage. Their name derives from their large scent glands, which have led the animals to be poached for black market perfume. Thanks to conservation efforts, their populations are on the rebound.',
    'Lynx are known for two main subspecies: North American and Eurasian. North American Lynx are found primarily in Canada and Northwest United States, and Eurasian are found in Europe, Russia, Scandinavia, the Middle East, and Asia. Found in dense forests with thick secondary growth as well as rocky mountainous terrain, they are wary animals who live a solitary life. Built to be able to track through heavy snow and as tireless walkers with long legs and big feet, they are mostly nocturnal but can be found covering their territory throughout the day.',
    'Capercaillie are the largest of the Grouse species.  They are also known as Wood Grouse and as Cock of the Woods. There are two main species of Capercaillie, Ivory and Black Billed, with many known subspecies of each. Found throughout Europe, Scandinavia and Russia, they live in wooded forests. These large birds are known and sought after to witness their mating rituals and to listen to the songs they sing.'
  ];
  List<String> scientificNamesZone5 = [
    'Moschus moschiferus',
    'Lynx canadensis',
    'Terao urogallus',
  ];

  List<String> animalImagesZone6 = [
    'assets/Wood Bison.jpg',
    'assets/Wolf.jpg',
    'assets/Rhino, Black.jpg',
  ];
  List<String> animalNamesZone6 = [
    'Wood Bison',
    'Wolf',
    'Rhino',
  ];
  List<String> descriptionsZone6 = [
    'The largest of the Bison species is the Wood Bison, also called the Wood Buffalo or Mountain Buffalo. Found mainly in northern boreal forests, their bodies are a lot denser with thicker, darker hair than their cousins, the Plains Bison. Wood Bison are found in Alaska, Northwest Territories, Yukon, Northern British Columbia and Northern Alberta. Due to large conservation efforts, their range is expanding with healthy populations.',
    'The Grey Wolf can be found in North America, Europe and Asia reaching upwards of 120 pounds. As very social pack animals, each wolf family has a distinct dynamic with each member having a specific role. Pups are taught to hunt in packs, which have made them very proficient and deadly hunters. Due to great conservation efforts, wolf populations are growing and thriving throughout their native homelands, which are often in northern latitudes. There are some 24 different subspecies of wolf in North America alone.',
    'Rhinoceros, or Rhino, are one of the last remaining Megafauna. Getting their name from the Latin “Nose Horn,” there are 2 remaining species in Africa: the Black and the White Rhino. With a great sense of hearing and smell but poor eyesight, Rhinos can be easily ambushed in the proper conditions. They are often poached for their horns, which are used as medicine and an aphrodisiac in Asia. Due to significant poaching, the Asian species of Rhino are under extreme threat.However, thanks to great conservation efforts in Africa, the Black and White Rhino populations are now growing and becoming very healthy in many regions.',
  ];
  List<String> scientificNamesZone6 = [
    'Bison bison athabascae',
    'Canis lupis',
    'Rhinocerotidae',
  ];

  List<String> animalImagesZone7 = [
    'assets/Lord Derby Eland.jpg',
    'assets/Mountain Nyala .jpg',
    'assets/Dwarf Forest Buffalo.jpeg',
    'assets/Saiga Antelope.jpg',
  ];
  List<String> animalNamesZone7 = [
    'Eland: Lord Derby Eland',
    'Nyala: Mountain Nyala',
    'Buffalo: Dwarf\nForest Buffalo',
    'Gazelle: Saiga Gazelle',
  ];
  List<String> descriptionsZone7 = [
    'Giant Eland or Lord Derby Eland are the largest of the Antelope species. Found in the forested savannas of central Africa, they call parts of Nigeria, Cameroon, Congo, Central African Republic and the Sudan home. Living in groups up to 30 animals, they are naturally very alert and wary, making them difficult to get close to and often on the constant move. For a large animal, they can run up to 40mph to escape threats. They are part of the Spiral Horns of Africa.',
    'Mountain Nyala are one of the largest of the Spiral Horned antelope of Africa. A Nyala by species, they are referred to by the local Ethiopians as the “highland greater kudu,” living in dense forests of central Ethiopia at altitudes up to 13,000 feet. Very shy and elusive animals, they spend a lot of time in the dense forest away from any human pressure and are most active from dusk till dawn searching for food.',
    'Dwarf Forest Buffalo, also referred to as Dwarf Buffalo or the Congo Buffalo, are the smallest species of buffalo in Africa. Their horns do not sweep down, which is typical of other buffalo, but they sweep out and back. Their ears are also a unique characteristicas they have large tuffs of hair on the ends. They live in dense rainforests and in smaller groups than their cousins, the Cape Buffalo, with numbers ranging in the 30s. They are found in west African in different regions of Guinea, Sierra Leone, Ghana, and Nigeria. They’re also found in Central Africa in Central African Republic, Congo, Cameroon, Rio Muni, Gabon, and Angola.',
    'There are two main subspecies of Saiga Antelope. They are a unique looking antelope with large noses made to help filter the dust and debris from their nomadic lifestyle. In the winter it also warms the cold air before it’s breathed in. They are found in large herds traveling the grasslands on the footsteps of the mountains of Mongolia, Kazakhstan, Uzbekistan and regions of Russia. These animals are on the decline due mainly to poaching for their meat as well as their horns for traditional Asian medicine. Large conservation efforts are underway to help bring the Saiga antelope back to its large numbers and to continue to be nomadic icons.',
  ];
  List<String> scientificNamesZone7 = [
    'Taurotragus debianus',
    'Tragelaphus buxtoni',
    'Syncerus caffer nanus',
    'Saiga tatarica',
  ];

  List<String> allAnimalNames = [];
  List<String> allAnimalImages = [];
  List<String> allAnimalDescriptions = [];
  List<String> allAnimalScientificNames = [];

  List<String> items = [
    "Zone Name",
    "African Diorama: Zone 1",
    "Mountain: Zone 2",
    "Cave: Zone 3",
    "Jungle: Zone 4",
    "Stairway Cover: Zone 5",
    "Mezzanine: Zone 6",
    "Old Trophy Room: Zone 7",
  ];
  String initialValue = 'Zone Name';

  initializeAllLists() {
    allAnimalDescriptions = descriptionsZone1 +
        descriptionsZone2 +
        descriptionsZone3 +
        descriptionsZone4 +
        descriptionsZone5 +
        descriptionsZone6 +
        descriptionsZone7;
    allAnimalImages = animalImagesZone1 +
        animalImagesZone2 +
        animalImagesZone3 +
        animalImagesZone4 +
        animalImagesZone5 +
        animalImagesZone6 +
        animalImagesZone7;
    allAnimalNames = animalNamesZone1 +
        animalNamesZone2 +
        animalNamesZone3 +
        animalNamesZone4 +
        animalNamesZone5 +
        animalNamesZone6 +
        animalNamesZone7;
    allAnimalScientificNames = scientificNamesZone1 +
        scientificNamesZone2 +
        scientificNamesZone3 +
        scientificNamesZone4 +
        scientificNamesZone5 +
        scientificNamesZone6 +
        scientificNamesZone7;
  }

  String shortDescription({String description}) {
    String shortDesc = description.substring(0, 250) + '...';
    return shortDesc;
  }

  List<String> audioPathsF = [
    'audio/Zone1.1-Leopard.mp3',
    'audio/Zone1.10-PatasMonkey.mp3',
    'audio/Zone1.2-GreaterKudu.mp3',
    'audio/Zone1.3-Sable.mp3',
    'audio/Zone1.4-UgandaCobb.mp3',
    'audio/Zone1.5%20-JacksonHeartBeast.mp3',
    'audio/Zone1.6-Gerenuk.mp3',
    'audio/Zone1.7-Korrigum.mp3',
    'audio/Zone1.8-WildDog.mp3',
    'audio/Zone1.9-Aardwolf.mp3',
    'audio/Zone2.1-Argali.mp3',
    'audio/Zone2.2-Urials.mp3',
    'audio/Zone2.3-NorthAmericanDesertBighorn.mp3',
    'audio/Zone2.4-Markhor.mp3',
    'audio/Zone2.5-Ibex.mp3',
    'audio/Zone2.6-Goats.mp3',
    'audio/Zone3.1-Bears(Polar).mp3',
    'audio/Zone4.1-Duiker.mp3',
    'audio/Zone4.2-DuikerAders.mp3',
    'audio/Zone4.3-RoyalAntelope.mp3',
    'audio/Zone4.4-Bongo.mp3',
    'audio/Zone4.5-WaterBuffalo.mp3',
    'audio/Zone4.6-GiantForestHog.mp3',
    'audio/Zone4.7-BrocketDeer.mp3',
    'audio/Zone5.1-MuskDeer.mp3',
    'audio/Zone5.2-Lynx.mp3',
    'audio/Zone5.3-CaperCaillie.mp3',
    'audio/Zone6.1-WoodBison.mp3',
    'audio/Zone6.2-Wolf.mp3',
    'audio/Zone6.3-Rhino.mp3',
    'audio/Zone7.1-Eland.mp3',
    'audio/Zone7.2-Nyala.mp3',
    'audio/Zone7.3-ForrestBuffalo.mp3',
    'audio/Zone7.4-Gazelle.mp3'
  ];

  // Future _initAudios() async {
  //
  //   final manifestContent = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
  //
  //   final Map<String, dynamic> manifestMap = json.decode(manifestContent);
  //   final audioPaths = manifestMap.keys
  //       .where((String key) => key.contains('audio/'))
  //       .where((String key) => key.contains('.mp3'))
  //       .toList();
  //   print(audioPaths);
  //   setState(() {
  //     audioPathsF=audioPaths;
  //   });
  //   print('Audios F:${audioPathsF[0]}');
  // }

  @override
  void initState() {
    SharedPreference.saveStringPreference(
      'description',
      '',
    );
    SharedPreference.saveStringPreference(
      'name',
      '',
    );
    SharedPreference.saveStringPreference(
      'imgPath',
      '',
    );
    SharedPreference.saveStringPreference(
      'audioPath',
      '',
    );
    SharedPreference.saveStringPreference(
      'scientificName',
      '',
    );
    SharedPreference.saveStringPreference(
      'zoneName',
      '',
    );
    _load();
    initializeAllLists();
    createMenuItem();

    // _initAudios();

    super.initState();
  }
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
  void dispose() {
    stop();
    super.dispose();
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

  int selectZone({String selectedZone}) {
    int index = zoneNames.indexOf(selectedZone);
    print(index);
    if (index == -1) {
      print('All');
      setState(() {
        isSearched = false;
        isZoneNameSearched = false;
      });
    } else if (index < 7) {
      return index;
    }
    return 100;
  }

  bool isZoneNameSearched = false;
  int zoneIndex = 0;

  Widget customDropDown() {
    return Container(
      height: hDimen(40),
      width: hDimen(235),
      child: DropdownButton<String>(
        value: initialValue,
        onChanged: (value) {
          setState(() {
            initialValue = value;
            isZoneNameSearched = true;
            isSearched = false;
          });
          print('selected');
          zoneIndex = selectZone(selectedZone: value);
        },
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
        // items: ,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
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
      width: hDimen(270),
      height: hDimen(80),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // hSpacing(hDimen(5)),
              Icon(
                Icons.location_on,
                color: Colors.black87,
                size: hDimen(25),
              ),
              hSpacing(hDimen(5)),
              customDropDown(),
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

  Widget searchFieldButton({
    Function onSearch,
  }) {
    return GestureDetector(
      onTap: onSearch,
      child: Padding(
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
      ),
    );
  }

  bool isSearched = false;
  int initialIndex = 0;

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
                // width: double.infinity,
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
            searchFieldButton(onSearch: () {
              if (controllerSearchAnimal.text != null &&
                  controllerSearchAnimal.text.isNotEmpty) {
                int index = searchAnimalName(
                  name: controllerSearchAnimal.text,
                );
                if (index == 100) {
                  print('Not Found');
                } else {
                  setState(() {
                    isSearched = true;
                    isZoneNameSearched = false;
                    initialIndex = index;
                  });
                  print('Index Searched Animal:$index');
                }
              } else {
                print('Error');
              }
            }),
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

  int searchAnimalName({String name}) {
    for (var i = 0; i < allAnimalNames.length; i++) {
      RegExp exp = new RegExp(
        "\\b" + name + "\\b",
        caseSensitive: false,
      );
      bool contain = exp.hasMatch(allAnimalNames[i]);
      if (contain) {
        return i;
      }
    }
    return 100;
  }

  Widget searchAnimalCard({
    String zoneName,
    String animalName,
    String description,
    String assetsPath,
    String audioPath,
    String scientificName,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      zoneName,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: hDimen(18),
                      ),
                      textAlign: TextAlign.start,
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
                shortDescription(
                  description: description,
                ),
                style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: hDimen(18),
                ),
              ),
            ),
            vSpacing(hDimen(20)),
            GestureDetector(
              child: exploreButton(),
              onTap: () {
                print('Hello');
                SharedPreference.saveStringPreference(
                  'description',
                  description,
                );
                SharedPreference.saveStringPreference(
                  'name',
                  animalName,
                );
                SharedPreference.saveStringPreference(
                  'imgPath',
                  assetsPath,
                );
                SharedPreference.saveStringPreference(
                  'audioPath',
                  audioPath,
                );
                SharedPreference.saveStringPreference(
                    'scientificName', scientificName);
                SharedPreference.saveStringPreference(
                  'zoneName',
                  zoneName,
                );
                widget.onExpand();
              },
            ),
            vSpacing(hDimen(20)),
          ],
        ),
      ),
    );
  }

  List<String> zoneNames = [
    'African Diorama: Zone 1',
    'Mountain: Zone 2',
    'Cave: Zone 3',
    'Jungle: Zone 4',
    'Stairway Cover: Zone 5',
    'Mezzanine: Zone 6',
    'Old Trophy Room: Zone 7',
  ];
  bool isLoadingAudios = false;

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
          isLoadingAudios
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: AppColor.colorPrimary,
                  ),
                )
              : isSearched
                  ? SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.all(hDimen(20)),
                        child: Container(
                          height: hDimen(340),
                          width: hDimen(335),
                          child: searchAnimalCard(
                            scientificName:
                                allAnimalScientificNames[initialIndex],
                            audioPath: audioPathsF[initialIndex],
                            description: allAnimalDescriptions[initialIndex],
                            animalName: allAnimalNames[initialIndex],
                            assetsPath: allAnimalImages[initialIndex],
                            zoneName: initialIndex < 10
                                ? zoneNames[0]
                                : initialIndex < 16
                                    ? zoneNames[1]
                                    : initialIndex < 17
                                        ? zoneNames[2]
                                        : initialIndex < 24
                                            ? zoneNames[3]
                                            : initialIndex < 27
                                                ? zoneNames[4]
                                                : initialIndex < 30
                                                    ? zoneNames[5]
                                                    : initialIndex < 34
                                                        ? zoneNames[6]
                                                        : "animal",
                          ),
                        ),
                      ),
                  )
                  : Expanded(
                      child: isZoneNameSearched
                          ? GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: hDimen(20),
                                crossAxisSpacing: hDimen(10),
                                crossAxisCount:
                                    orientation == Orientation.portrait ? 2 : 3,
                                childAspectRatio: 0.9,
                              ),
                              itemBuilder: ((context, index) {
                                return searchAnimalCard(
                                  audioPath: zoneIndex == 0
                                      ? audioPathsF[index]
                                      : zoneIndex == 1
                                          ? audioPathsF[index + 10]
                                          : zoneIndex == 2
                                              ? audioPathsF[index + 16]
                                              : zoneIndex == 3
                                                  ? audioPathsF[index + 17]
                                                  : zoneIndex == 4
                                                      ? audioPathsF[index + 24]
                                                      : zoneIndex == 5
                                                          ? audioPathsF[
                                                              index + 27]
                                                          : zoneIndex == 6
                                                              ? audioPathsF[
                                                                  index + 30]
                                                              : audioPathsF[
                                                                  index],
                                  scientificName: zoneIndex == 0
                                      ? scientificNamesZone1[index]
                                      : zoneIndex == 1
                                          ? scientificNamesZone2[index]
                                          : zoneIndex == 2
                                              ? scientificNamesZone3[index]
                                              : zoneIndex == 3
                                                  ? scientificNamesZone4[index]
                                                  : zoneIndex == 4
                                                      ? scientificNamesZone5[
                                                          index]
                                                      : zoneIndex == 5
                                                          ? scientificNamesZone6[
                                                              index]
                                                          : zoneIndex == 6
                                                              ? animalImagesZone7[
                                                                  index]
                                                              : allAnimalNames[
                                                                  index],
                                  assetsPath: zoneIndex == 0
                                      ? animalImagesZone1[index]
                                      : zoneIndex == 1
                                          ? animalImagesZone2[index]
                                          : zoneIndex == 2
                                              ? animalImagesZone3[index]
                                              : zoneIndex == 3
                                                  ? animalImagesZone4[index]
                                                  : zoneIndex == 4
                                                      ? animalImagesZone5[index]
                                                      : zoneIndex == 5
                                                          ? animalImagesZone6[
                                                              index]
                                                          : zoneIndex == 6
                                                              ? animalImagesZone7[
                                                                  index]
                                                              : allAnimalNames[
                                                                  index],
                                  description: zoneIndex == 0
                                      ? descriptionsZone1[index]
                                      : zoneIndex == 1
                                          ? descriptionsZone2[index]
                                          : zoneIndex == 2
                                              ? descriptionsZone3[index]
                                              : zoneIndex == 3
                                                  ? descriptionsZone4[index]
                                                  : zoneIndex == 4
                                                      ? descriptionsZone5[index]
                                                      : zoneIndex == 5
                                                          ? descriptionsZone6[
                                                              index]
                                                          : zoneIndex == 6
                                                              ? descriptionsZone7[
                                                                  index]
                                                              : descriptionsZone1[
                                                                  index],
                                  zoneName: zoneIndex == 0
                                      ? zoneNames[0]
                                      : zoneIndex == 1
                                          ? zoneNames[1]
                                          : zoneIndex == 2
                                              ? zoneNames[2]
                                              : zoneIndex == 3
                                                  ? zoneNames[3]
                                                  : zoneIndex == 4
                                                      ? zoneNames[4]
                                                      : zoneIndex == 5
                                                          ? zoneNames[
                                                              5]
                                                          : zoneIndex == 6
                                                              ? zoneNames[
                                                                  6]
                                                              : zoneNames[
                                                                  7],
                                  animalName: zoneIndex == 0
                                      ? animalNamesZone1[index]
                                      : zoneIndex == 1
                                      ? animalNamesZone2[index]
                                      : zoneIndex == 2
                                      ? animalNamesZone3[index]
                                      : zoneIndex == 3
                                      ? animalNamesZone4[index]
                                      : zoneIndex == 4
                                      ? animalNamesZone5[index]
                                      : zoneIndex == 5
                                      ? animalNamesZone6[
                                  index]
                                      : zoneIndex == 6
                                      ? animalNamesZone7[
                                  index]
                                      : animalNamesZone1[
                                  index],
                                );
                              }),
                              itemCount: zoneIndex == 0
                                  ? animalNamesZone1.length
                                  : zoneIndex == 1
                                      ? animalNamesZone2.length
                                      : zoneIndex == 2
                                          ? animalNamesZone3.length
                                          : zoneIndex == 3
                                              ? animalNamesZone4.length
                                              : zoneIndex == 4
                                                  ? animalNamesZone5.length
                                                  : zoneIndex == 5
                                                      ? animalNamesZone6.length
                                                      : zoneIndex == 6
                                                          ? animalNamesZone7
                                                              .length
                                                          : animalNamesZone1
                                                              .length,
                              physics: BouncingScrollPhysics(),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: hDimen(20),
                                crossAxisSpacing: hDimen(10),
                                crossAxisCount:
                                    orientation == Orientation.portrait ? 2 : 3,
                                childAspectRatio: 0.9,
                              ),
                              itemBuilder: ((context, index) {
                                return searchAnimalCard(
                                  scientificName: allAnimalScientificNames[index],
                                  audioPath: audioPathsF[index],
                                  assetsPath: allAnimalImages[index],
                                  description: allAnimalDescriptions[index],
                                  zoneName: index < 10
                                      ? zoneNames[0]
                                      : index < 16
                                          ? zoneNames[1]
                                          : index < 17
                                              ? zoneNames[2]
                                              : index < 24
                                                  ? zoneNames[3]
                                                  : index < 27
                                                      ? zoneNames[4]
                                                      : index < 30
                                                          ? zoneNames[5]
                                                          : index < 34
                                                              ? zoneNames[6]
                                                              : "animal",
                                  animalName: allAnimalNames[index],
                                );
                              }),
                              itemCount: allAnimalNames.length,
                              physics: BouncingScrollPhysics(),
                            ),
                    ),
        ],
      ),
    );
  }
}
