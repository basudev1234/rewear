import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:uuid/uuid.dart';

import '../../Product/chooseCategory.dart';
import '../../Widgets/Dialogs/error.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  final picker = ImagePicker();
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController originalPrice = TextEditingController();
  TextEditingController description = TextEditingController();
  String productID = DateTime.now().millisecondsSinceEpoch.toString();

  // File? _image;
  List<File> _image = [];
  late Object val = "2";
  late int ind = 0;
  var uuid = const Uuid();
  GlobalKey formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width),
            child: Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: double.infinity,
                      child: GridView.builder(
                          itemCount: _image.length + 1,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return index == 0
                                ? Center(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.camera_alt,
                                          ),
                                          onPressed: () async {
                                            try {
                                              var status = await Permission
                                                  .camera.status;
                                              if (status.isGranted) {
                                                final pickedFile =
                                                    await picker.pickImage(
                                                        source:
                                                            ImageSource.camera);
                                                setState(() {
                                                  _image.add(
                                                    File(
                                                      pickedFile!.path,
                                                    ),
                                                  );
                                                });
                                              } else {
                                                Permission.camera.request();
                                              }
                                            } catch (e) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    e.toString(),
                                                  ),
                                                  duration: const Duration(
                                                    seconds: 30,
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.photo,
                                          ),
                                          onPressed: () async {
                                            final pickedFile =
                                                await picker.pickImage(
                                                    source:
                                                        ImageSource.gallery);
                                            setState(() {
                                              _image.add(
                                                File(
                                                  pickedFile!.path,
                                                ),
                                              );
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(_image[index - 1]),
                                            fit: BoxFit.cover)),
                                  );
                          }),
                    ),
                    ToggleSwitch(
                      fontSize: 16.0,
                      initialLabelIndex: ind,
                      centerText: true,
                      activeBgColor: [Colors.black],
                      activeFgColor: Colors.white,
                      inactiveBgColor: Colors.black.withOpacity(0.05),
                      inactiveFgColor: Colors.black,
                      totalSwitches: 5,
                      labels: ['S', 'M', 'L', 'XL', 'XXL'],
                      onToggle: (index) {
                        setState(() {
                          ind = index!;
                          print(ind);
                        });
                      },
                    ),
                    const Divider(),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      obscure: false,
                      textInputType: TextInputType.name,
                      textEditingController: title,
                      string: "Title",
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      obscure: false,
                      textInputType: TextInputType.number,
                      textEditingController: price,
                      string: "Lesser Price",
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      obscure: false,
                      textInputType: TextInputType.number,
                      textEditingController: originalPrice,
                      string: "Original Price",
                    ),
                    CustomTextField(
                      textInputAction: TextInputAction.next,
                      autofocus: false,
                      obscure: false,
                      textInputType: TextInputType.name,
                      textEditingController: description,
                      string: "Description",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        height: Get.height * 0.08,
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: Get.width * 0.1,
            ),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    30,
                  ),
                ),
              ),
              height: Get.height * 0.08,
              minWidth: Get.width * 0.54,
              color: Colors.black,
              onPressed: () {
                if (title.text.isNotEmpty &&
                    originalPrice.text.isNotEmpty &&
                    price.text.isNotEmpty) {
                  if (_image.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please add image",
                        backgroundColor: Colors.redAccent);
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ChooseCategory(
                          size: ind,
                          image: _image,
                          desctiption: description.text,
                          id: uuid.v4(),
                          originalPrice: originalPrice.text,
                          price: price.text,
                          title: title.text,
                        ),
                      ),
                    );
                    // uploadImage();
                    // print("Image is not null");
                  }
                } else {
                  Fluttertoast.showToast(
                      msg: "Please fill in all the fields",
                      backgroundColor: Colors.redAccent);
                }
              },
              child: const Text(
                "NEXT",
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text(
          "Add Product",
        ),
        leading: const CloseButton(),
      ),
    );
  }

  uploadData(String name) async {
    List<String> splitList = name.split(' ');
    List<String> indexList = [];
    for (int i = 0; i < splitList.length; i++,) {
      for (int j = 0; j < splitList[i].length + 1; j++) {
        indexList.add(splitList[i].substring(0, j).toLowerCase());
      }
    }
    for (var element in indexList) {
      print("\n $element");
    }
    print(indexList);
    return indexList;
  }
}

class CustomTextField extends StatelessWidget {
  final String? string;
  final bool? obscure;
  final FormFieldValidator? validator;
  final bool? autofocus;
  final FocusNode? focusNode;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextEditingController? textEditingController;
  const CustomTextField({
    this.autofocus,
    this.textEditingController,
    this.textInputAction,
    this.focusNode,
    this.validator,
    this.textInputType,
    this.string,
    this.obscure,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: textEditingController,
      autofocus: autofocus!,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        } else {
          return null;
        }
      },
      focusNode: focusNode,
      obscureText: obscure!,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: const TextStyle(fontWeight: FontWeight.w700),
      decoration: InputDecoration(
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(14),
        //   ),
        // ),
        labelText: string,
        filled: true,
        // prefixIcon: Icon(
        //   iconData,
        //   color: Colors.deepOrangeAccent,
        // ),
      ),
    );
  }
}
