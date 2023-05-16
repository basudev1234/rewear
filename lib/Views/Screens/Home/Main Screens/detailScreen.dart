import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/route_manager.dart';

class DetailScreen extends StatelessWidget {
  late Map data;

  DetailScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    SizeButton(
                      size: "S",
                    ),
                    SizeButton(
                      size: "M",
                    ),
                    SizeButton(
                      size: "L",
                    ),
                    SizeButton(
                      size: "XL",
                    ),
                    SizeButton(
                      size: "XXL",
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        data["imageURL"][0],
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      30,
                    ),
                  ),
                ),
                height: Get.height * 0.6,
                width: Get.width * 0.7,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              data["title"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              data["description"],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: Get.height * 0.08,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            MaterialButton(
              child: Text(
                "BUY NOW",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    30,
                  ),
                ),
              ),
              height: Get.height * 0.08,
              minWidth: Get.width * 0.54,
              color: Colors.black,
              onPressed: () {},
            ),
            SizedBox(
              width: Get.width * 0.1,
            ),
            RichText(
              text: TextSpan(
                text: "₹" + data["originalPrice"],
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough),
                children: [
                  TextSpan(
                      text: "     ₹" + data["price"],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          fontSize: 19)),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.close,
          ),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.greenAccent,
        elevation: 0,
      ),
    );
  }
}

class SizeButton extends StatelessWidget {
  SizeButton({
    super.key,
    required this.size,
  });
  final String size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Material(
        borderRadius: BorderRadius.circular(6),
        elevation: 10,
        shadowColor: Colors.greenAccent,
        child: Container(
          child: Center(
            child: Text(
              size,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          height: Get.width * 0.1,
          width: Get.width * 0.1,
          decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(6)),
        ),
      ),
    );
  }
}
