import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rewear/Views/Screens/Authentication/gate_screen.dart';
import 'package:rewear/Views/Screens/Home/Main%20Screens/main_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:provider/provider.dart';
import 'package:rewear/main.dart';

import '../../Core/Model/category.dart';

class ChooseCategory extends StatelessWidget {
  final String title;
  final String price;
  final String originalPrice;
  final String desctiption;
  final String id;
  final int size;
  final List<File> image;
  ChooseCategory({
    required this.size,
    required this.image,
    required this.price,
    required this.originalPrice,
    required this.desctiption,
    required this.id,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Choose Category"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.24,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1 / 1.2,
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  Fluttertoast.showToast(msg: "Adding please wait...");
                  try {
                    await uploadFiles(
                      context: context,
                      category: category2.keys.elementAt(index).toString(),
                    ).whenComplete(
                        () => Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const MyApp(),
                            ),
                            (route) => false));
                  } catch (e) {
                    Fluttertoast.showToast(msg: e.toString());
                  }
                },
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Lottie.asset(
                          categoryImage[category2.keys.elementAt(index)],
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
      // body: SafeArea(
      //     child: Column(
      //   children: List.generate(category.length, (index) {
      //     return ListTile(
      //       title: Text(
      //         category.elementAt(index),
      //       ),

      //       trailing: const Icon(CupertinoIcons.forward),
      //     );
      //   }),
      // )),
    );
  }

  Future<List<String>> uploadFiles({
    required BuildContext context,
    required String category,
  }) async {
    List<String> imageUrls = await Future.wait(
      image.map(
        (_image) => uploadImage(
          context: context,
          image: _image,
        ),
      ),
    );
    writeToDatabase(
      category: category,
      url: imageUrls,
      search: await uploadData(
        title.toLowerCase(),
      ),
    );

    return imageUrls;
  }

// this creates a split string for firebase search functionality
  uploadData(String name) async {
    List<String> caseSearchList = [];
    String temp = "";
    for (int i = 0; i < name.length; i++) {
      temp = temp + name[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }

// this function upload the image to firebase storage and alse initiate the write to database functionality.
  Future<String> uploadImage({
    required BuildContext context,
    required File image,
  }) async {
    firebase_storage.UploadTask task = firebase_storage.FirebaseStorage.instance
        .ref("SalonImage")
        .child("PImage${DateTime.now().millisecondsSinceEpoch}")
        .putFile(
          image,
        );

    // task.snapshotEvents.listen(
    //   (firebase_storage.TaskSnapshot snapshot) {
    //     print('Task state: ${snapshot.state}');
    //     print(
    //       'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %',
    //     );
    //   },
    //   onError: (e) {
    //     // The final snapshot is also available on the task via `.snapshot`,
    //     // this can include 2 additional states, `TaskState.error` & `TaskState.canceled`
    //     print(task.snapshot);

    //     if (e.code == 'permission-denied') {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         const SnackBar(
    //           behavior: SnackBarBehavior.floating,
    //           content: Text(
    //             "User dosen't have permission",
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );

    // We can still optionally use the Future alongside the stream.
    try {
      await task;
      String url = await task.snapshot.ref.getDownloadURL();
    } on firebase_core.FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        print(
          'User does not have permission to upload to this reference.',
        );
      }
      // ...
    }
    return await task.snapshot.ref.getDownloadURL();
  }

  Future writeToDatabase({
    List? url,
    List? search,
    required String category,
  }) {
    FirebaseFirestore.instance.collection("products").doc().set({
      "price": price,
      "originalPrice": originalPrice,
      "publishDate": DateTime.now(),
      "available": true,
      "search": search,
      "imageURL": url,
      "id": id,
      "description": desctiption,
      "category": category,
      "title": title,
      "size": size,
    });
    throw 'empty';
  }
}
