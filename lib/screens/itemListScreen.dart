import 'package:ARhomes/models/ItemModel.dart';
import 'package:ARhomes/screens/accountsPage.dart';
import 'package:ARhomes/screens/arViewScreen.dart';
import 'package:ARhomes/screens/or_divider.dart';
import 'package:ARhomes/screens/showSnackBar.dart';
import 'package:ARhomes/screens/welcomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class itemListScreen extends StatefulWidget {
  const itemListScreen({Key? key}) : super(key: key);

  @override
  State<itemListScreen> createState() => _itemListScreenState();
}

class _itemListScreenState extends State<itemListScreen> {
  int _selectedIndex = 0;

  // final pages = [
  //   const itemListScreen(),
  //   const itemListScreen(),
  //   const AccountsPage(),
  // ];
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

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
  List<ItemModel> itemsList = [
    // ItemModel(
    //   'Double Bed',
    //   'Double Bed with 2 Lamps',
    //   'items/clock2.png',
    //   12,
    // ),
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
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Home ',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontFamily: 'cursive',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Decoring',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontFamily: 'cursive',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          OrDivider(
            "Categories",
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 150, minHeight: 100.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,

              itemCount: itemsList.length, // Display two cards per row
              shrinkWrap: true,

              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100.0,
                  width: 100.0,
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    boxShadow: [
                      new BoxShadow(
                          color: Color.fromARGB(100, 0, 0, 0),
                          blurRadius: 5.0,
                          offset: Offset(5.0, 5.0))
                    ],
                    border: Border.all(
                      width: 4.0,
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 91, 131, 131),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      image: AssetImage(items[index].pic),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Image(
                        //   alignment: Alignment.center,
                        //   image: AssetImage(
                        //     itemsList[index].pic,
                        //   ),
                        // ),
                        Text(
                          items[index].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView(
          //     children: <Widget>[
          //       Container(
          //         height: 80.0,
          //         child: Row(
          //           children: [
          //             Row(
          //               children: [
          //                 ListView(
          //                   scrollDirection: Axis.horizontal,
          //                   children: List.generate(
          //                     items.length,
          //                     (int index) {
          //                       return Card(
          //                         color: Colors.white,
          //                         child: Container(
          //                           width: 50.0,
          //                           height: 50.0,
          //                           decoration: BoxDecoration(
          //                             borderRadius:
          //                                 BorderRadius.all(Radius.circular(
          //                               50,
          //                             )),
          //                           ),
          //                           child: Text("$index"),
          //                         ),
          //                       );
          //                     },
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Flexible(
          //   fit: ,
          //   child: Row(
          //     children: <Widget>[
          //       Flexible(
          //         child: CustomScrollView(
          //           shrinkWrap: true,
          //           scrollDirection: Axis.horizontal,
          //           slivers: <Widget>[
          //             SliverPadding(
          //               padding: const EdgeInsets.all(20.0),
          //               sliver: SliverList(
          //                 delegate: SliverChildListDelegate(
          //                   <Widget>[
          //                     const Text('this'),
          //                     const Text('is'),
          //                     const Text('scroll'),
          //                     const Text('view'),
          //                     const Text('inside'),
          //                     const Text('list'),
          //                     const Text('view'),
          //                     const Text('in'),
          //                     const Text('horizontal'),
          //                     const Text('direction')
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Flexible(
          //     child:
          //         ListView(scrollDirection: Axis.horizontal, children: [])),
          OrDivider(
            "Featured Furnishing Items",
          ),
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

// class itemListScreen extends StatelessWidget {
  
// }
