import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:rewear/Core/Model/category.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/gender.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/swap.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/who.dart';
import 'package:rewear/Views/Screens/Home/add_product.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../../Core/Provider/choice_chip_provider.dart';
import 'detailScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // appBar: buildAppBar(),
      child: Container(
        // padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (context) => Who(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(
                        30,
                      ),
                    ),
                  ),
                  height: Get.height * 0.4,
                  child: Image.asset(
                    'Assets/logo/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => Swap(title: 'Rent'),
                        ),
                      );
                    },
                    child: topWidgets(
                      textArg: "Rent",
                      image: 'Assets/dummy/rent.jpg',
                      colorArg: Colors.greenAccent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(builder: (context) => AddProducts()),
                      );
                    },
                    child: topWidgets(
                      textArg: "Donate",
                      image: 'Assets/dummy/donate.jpg',
                      colorArg: Colors.amberAccent,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
                          builder: (context) => Swap(title: 'Swap'),
                        ),
                      );
                    },
                    child: topWidgets(
                      image: 'Assets/dummy/swap.jpg',
                      textArg: "Swap",
                      colorArg: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CarouselSlider(
                  items: List.generate(
                      3,
                      (index) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => Swap(title: 'SALE !'),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      imageList[index],
                                    ),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(
                                  14,
                                ),
                                color: Colors.greenAccent,
                              ),
                              // color: Colors.amber,
                            ),
                          )),
                  options: CarouselOptions(
                    height: Get.height * 0.25,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.82,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,

                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    // onPageChanged: callbackFunction,
                    scrollDirection: Axis.horizontal,
                  )),
              const SizedBox(
                height: 20,
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "   Categories",
                        style: TextStyle(
                          color: Colors.black, fontSize: 18,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigator.of(context).push(
                          //   CupertinoPageRoute(
                          //     builder: (context) => MainCategory(),
                          //   ),
                          // );
                        },
                        child: const Text(
                          "View all",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.24,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1 / 1.2,
                          crossAxisCount: 3,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => Gender(
                                    title: category2.keys.elementAt(index),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    child: Lottie.asset(
                                      categoryImage[
                                          category2.keys.elementAt(index)],
                                    ),
                                  ),
                                  Text(
                                    category2.keys.elementAt(index),
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                color: color[index],
                              ),
                            ),
                          );
                        },
                        itemCount: 3,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recomended",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        MaterialButton(
                          child: Text("More"),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Swap(title: "")));
                          },
                          color: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .snapshots(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? SingleChildScrollView(
                                padding: const EdgeInsets.all(
                                  15,
                                ),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      snapshot.data!.docs.length,
                                      (index) => InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                          data: snapshot
                                                              .data!.docs[index]
                                                              .data()),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 9,
                                                  left: 9,
                                                  bottom: 10),
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                elevation: 10,
                                                child: Container(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Image.network(
                                                          snapshot.data!
                                                                  .docs[index]
                                                                  .data()[
                                                              "imageURL"][0],
                                                          height:
                                                              Get.height * 0.18,
                                                          width:
                                                              Get.width * 0.38,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                "  ${snapshot.data!.docs[index].data()["title"]}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            Text(
                                                              "₹ ${snapshot.data!.docs[index].data()["originalPrice"]}    ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .redAccent,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          "   ₹ ${snapshot.data!.docs[index].data()["price"]}    ",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .greenAccent,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  height: Get.height * 0.25,
                                                  width: Get.width * 0.38,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
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
                              category2.keys.elementAt(index),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.white, fontSize: 14),
                            ),
                            selected: Provider.of<ChoiceChipProvider>(context)
                                        .choice ==
                                    index
                                ? true
                                : false,
                            selectedColor: Colors.black,
                            onSelected: (value) {
                              Provider.of<ChoiceChipProvider>(context,
                                      listen: false)
                                  .updateChoice(choice: index);
                            },
                            // backgroundColor: color,
                            elevation: 1,
                            // padding: EdgeInsets.symmetric(
                            //   ),
                          ),
                        );
                      },
                      itemCount: category2.keys.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .where(
                            'category',
                            isEqualTo: category2.keys.elementAt(
                                Provider.of<ChoiceChipProvider>(context)
                                    .choice),
                          )
                          .snapshots(),
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? SingleChildScrollView(
                                padding: const EdgeInsets.all(
                                  15,
                                ),
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: List.generate(
                                      snapshot.data!.docs.length,
                                      (index) => InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                  builder: (context) =>
                                                      DetailScreen(
                                                          data: snapshot
                                                              .data!.docs[index]
                                                              .data()),
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 9,
                                                  left: 9,
                                                  bottom: 10),
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                elevation: 10,
                                                child: Container(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Image.network(
                                                          snapshot.data!
                                                                  .docs[index]
                                                                  .data()[
                                                              "imageURL"][0],
                                                          height:
                                                              Get.height * 0.18,
                                                          width:
                                                              Get.width * 0.38,
                                                          fit: BoxFit.cover,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                "  ${snapshot.data!.docs[index].data()["title"]}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            Text(
                                                              "₹ ${snapshot.data!.docs[index].data()["originalPrice"]}    ",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .redAccent,
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          "   ₹ ${snapshot.data!.docs[index].data()["price"]}    ",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .greenAccent,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  height: Get.height * 0.25,
                                                  width: Get.width * 0.38,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )),
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      }),
                ],
              ),
              // SizedBox(
              //   height: 500,
              //   width: Get.width,
              //   child: MasonryGridView.builder(
              //       gridDelegate:
              //           SliverSimpleGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2),
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: const EdgeInsets.all(
              //             8,
              //           ),
              //           child: Image.network(imageList[index]),
              //         );
              //       }),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class topWidgets extends StatelessWidget {
  topWidgets({
    super.key,
    required this.textArg,
    required this.colorArg,
    required this.image,
  });
  final String textArg;
  final String image;
  final Color colorArg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: Get.height * 0.18,
      width: Get.width * 0.3,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          opacity: 0.5,
          fit: BoxFit.cover,
        ),
        // gradient: ,
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            child: Icon(
              CupertinoIcons.chevron_right,
              color: Colors.white,
            ),
            backgroundColor: Colors.black,
            radius: 15,
          ),
          Text(
            textArg,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black.withOpacity(
                0.8,
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<String> imageList = [
  'https://firebasestorage.googleapis.com/v0/b/rewear-crowd.appspot.com/o/download.jpeg?alt=media&token=80b2a5c2-4d8b-41da-ae01-e21fdb07f0d4',
  'https://firebasestorage.googleapis.com/v0/b/rewear-crowd.appspot.com/o/Summer_Sale_Background_4.jpg?alt=media&token=3eb58212-bcc1-4758-b091-a55fb7f58f7f',
  'https://firebasestorage.googleapis.com/v0/b/rewear-crowd.appspot.com/o/5292119.jpg?alt=media&token=8f1c69d8-8857-40cf-b8f4-bd666724d7b3',
];

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.abc),
      onPressed: () {},
    ),
  );
}
