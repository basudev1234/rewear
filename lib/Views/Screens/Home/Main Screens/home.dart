import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
              const Text(
                "ReWear",
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  topWidgets(
                    textArg: "Rent",
                    colorArg: Colors.greenAccent,
                  ),
                  topWidgets(
                    textArg: "Donate",
                    colorArg: Colors.amberAccent,
                  ),
                  topWidgets(
                    textArg: "Swap",
                    colorArg: Colors.orangeAccent,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CarouselSlider(
                  items: List.generate(
                      4,
                      (index) => Container(
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
                            onTap: () {},
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
                          onPressed: () {},
                          color: Colors.greenAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(
                      15,
                    ),
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          10,
                          (index) => InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    CupertinoPageRoute(
                                      builder: (context) => DetailScreen(),
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
                                              imageList[1],
                                              height: Get.height * 0.18,
                                              width: Get.width * 0.38,
                                              fit: BoxFit.cover,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("   Title"),
                                                Text("#100   ")
                                              ],
                                            ),
                                            Text(
                                              "   Data",
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
                                      height: Get.height * 0.25,
                                      width: Get.width * 0.38,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                    ),
                  ),
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
  });
  final String textArg;
  final Color colorArg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: Get.height * 0.15,
      width: Get.width * 0.25,
      decoration: BoxDecoration(
        // gradient: ,
        borderRadius: BorderRadius.circular(15),
        color: colorArg,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 10,
          ),
          Text(
            textArg,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

List<String> imageList = [
  'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
  'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
  'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
  'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
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
