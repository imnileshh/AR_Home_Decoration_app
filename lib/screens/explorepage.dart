import 'package:ARhomes/models/ItemModel.dart';
import 'package:ARhomes/screens/arViewScreen.dart';
import 'package:ARhomes/screens/color_pallet_explore.dart';
import 'package:ARhomes/screens/homeView.dart';
import 'package:ARhomes/screens/or_divider.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<ItemModel> items = [
    // ItemModel(
    //   'Double Bed',
    //   'Double Bed with 2 Lamps',
    //   'items/clock2.png',
    //   12,
    // ),
    ItemModel(
      'Double Bed',
      'Double Bed with 2 Lamps',
      'items/bed.png',
      12,
    ),
    ItemModel(
      'Single Sofa T55',
      'White Sofa For Your Home',
      'items/sofa_white.png',
      16,
    ),
    ItemModel(
      'Double Sofa ',
      'Three Seater Branded Sofa',
      'items/sofa_yellow.png',
      10,
    ),
    ItemModel(
      'Chair Brown ',
      'A Small Chair For Your Backyard ',
      'items/pc_table.png',
      6,
    ),
    ItemModel(
      'G78 Single Sofa',
      'Branded Single Yellow Sofa',
      'items/single_sofa.png',
      10,
    ),
    ItemModel(
      'Dinner Table',
      'Beautiful Dinner Table For Family',
      'items/dinner_table.png',
      11,
    ),
    ItemModel(
      'Branded Pc Table',
      'Wooden Branded UK Table',
      'items/pc_table2.png',
      10,
    ),
    ItemModel(
      'Chair Short',
      'A Small Cheap Chair',
      'items/chair2.png',
      11,
    ),
    ItemModel(
      'Wooden Table',
      'Wooden Branded UK Table',
      'items/table.png',
      16,
    ),
    ItemModel(
      'Thai Double Bed',
      'Branded Double Bed With Locker ',
      'items/bed_double.png',
      10,
    ),

    ItemModel(
      'Rotatable Chair',
      'A Brand New Rotatable Chair',
      'items/rot_chair.png',
      10,
    ),
    ItemModel(
      'UK5 Sofa',
      'Brand New Single Sofa',
      'items/sofa_uk.png',
      10,
    ),
    ItemModel(
      'T80 Dinner Table',
      'Beautiful table for Dinner',
      'items/dinner_table2.png',
      10,
    ),
    ItemModel(
      '2 Seat Sofa',
      'This is branded new Double sofa',
      'items/sofa_yellow.png',
      10,
    ),
    ItemModel(
      'Grey Sofa',
      'This is a 2 seater and Brand new double sofa',
      'items/sofa_grey.png',
      10,
    ),
    ItemModel(
      'Brown Chair Y9',
      'A Beautiful chair for sitting',
      'items/chair1.png',
      10,
    ),
    ItemModel(
      'HU9 Dinner Table',
      'Beautiful Table For Dinner',
      'items/dinner_table3.png',
      10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 75, 75),
      body: Column(
        children: [
          SizedBox(
            height: 28,
          ),
          Text(
            "Explore Catalog",
            style: TextStyle(
              fontFamily: "Pony",
              color: Colors.white70,
              fontSize: 40,
            ),
          ),
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => ColorPallet(),
          //           ));
          //     },
          //     icon: Icon(Icons.view_comfy_rounded)),

          // OrDivider(
          //   "Featured Furnishing Items",
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                // scrollDirection:
                //     Axis.horizontal, // Display cards horizontally
                itemCount: items.length, // Display two cards per row
                shrinkWrap: true,

                itemBuilder: (BuildContext context, int index) {
                  // final int startIndex = index;
                  // final int endIndex = startIndex + 2;
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ARViewScreen(
                            itemImg: items[index].pic,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset(
                                items[index].pic,
                                width: 60,
                              ),
                            ),
                            Text(
                              items[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              items[index].detail,
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CategorieTile extends StatelessWidget {
  final String imgUrl, title;

  CategorieTile({required this.imgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imgUrl,
                    height: 50, width: 100, fit: BoxFit.cover)),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black38,
                ),
                alignment: Alignment.center,
                height: 50,
                width: 100,
                child: Text(title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ))),
          ],
        ),
      ),
    );
  }
}

class NoGLowBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
