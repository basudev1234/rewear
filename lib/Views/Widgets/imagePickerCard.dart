import 'package:flutter/material.dart';

Widget ImagePickerCard({
  required BuildContext context,
  required String title,
  IconData? iconData,
  Function? function,
}) {
  return InkWell(
    onTap: function as void Function()?,
    radius: 20,
    child: Card(
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      color: Colors.white,
      elevation: 20,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.13,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 30,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    ),
  );
}
