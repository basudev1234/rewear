import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/detailScreen.dart';

import '../../../../Core/Model/category.dart';
import '../../../../Core/Provider/choice_chip_provider.dart';

class Gender extends StatefulWidget {
  late String title;
  Gender({super.key, required this.title});

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          height: Get.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  "FILTER",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              VerticalDivider(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "SORT BY",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              VerticalDivider(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "NEW ITEMS",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                      padding: const EdgeInsets.all(8),
                      labelPadding: const EdgeInsets.all(2.0),

                      label: Text(
                        category3.keys.elementAt(index),
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                      selected:
                          Provider.of<ChoiceChipProvider>(context).choice ==
                                  index
                              ? true
                              : false,
                      selectedColor: Colors.black,
                      onSelected: (value) {
                        Provider.of<ChoiceChipProvider>(context, listen: false)
                            .updateChoice(choice: index);
                      },
                      // backgroundColor: color,
                      elevation: 1,
                      // padding: EdgeInsets.symmetric(
                      //   ),
                    ),
                  );
                },
                itemCount: category3.keys.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .where("category", isEqualTo: widget.title)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: Get.height * 0.8,
                      width: Get.width,
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data!.docs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 3 / 4),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  CupertinoPageRoute(
                                    builder: (context) => DetailScreen(
                                        data:
                                            snapshot.data!.docs[index].data()),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 9, left: 9, bottom: 10),
                                child: Material(
                                  borderRadius: BorderRadius.circular(14),
                                  elevation: 10,
                                  child: Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.network(
                                            snapshot.data!.docs[index]
                                                .data()["imageURL"][0],
                                            height: Get.height * 0.2,
                                            width: Get.width * 0.38,
                                            fit: BoxFit.cover,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  "  ${snapshot.data!.docs[index].data()["title"]}",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Text(
                                                "₹ ${snapshot.data!.docs[index].data()["originalPrice"]}    ",
                                                style: TextStyle(
                                                  color: Colors.redAccent,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                ),
                                              )
                                            ],
                                          ),
                                          Text(
                                            "   ₹ ${snapshot.data!.docs[index].data()["price"]}    ",
                                            style: TextStyle(
                                              color: Colors.greenAccent,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          )
                                        ],
                                      ),
                                    ),
                                    height: double.infinity,
                                    width: Get.width * 0.38,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        14,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // return snapshot.hasData
                  //     ? SingleChildScrollView(
                  //         padding: const EdgeInsets.all(
                  //           15,
                  //         ),
                  //         physics: BouncingScrollPhysics(),
                  //         scrollDirection: Axis.horizontal,
                  //         child: Row(
                  //           children: List.generate(
                  //               snapshot.data!.docs.length,
                  // (index) =>
                  //         ),
                  //       )
                  //     : Center(
                  //         child: CircularProgressIndicator(),
                  //       );
                }),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
