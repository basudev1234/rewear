import 'package:flutter/material.dart';

Widget circleAvataShimmer() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(backgroundColor: Colors.white.withOpacity(0.7)),
      const SizedBox(
        height: 10,
      ),
      Container(
        width: 50,
        height: 10,
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
        ),
      ),
    ],
  );
}
