import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class Who extends StatelessWidget {
  const Who({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "ReWear Crowd focuses on making a change. Taking a step forward and breaking the norms. We offer hassle free services, 24X7 customer service to always be there for our crowd !",
              style: GoogleFonts.raleway(
                  color: Colors.black.withOpacity(0.7), fontSize: 18),
            ),
            const SizedBox(
              height: 45,
            ),
            Text(
              "What We Do?",
              style: GoogleFonts.raleway(color: Colors.black, fontSize: 24),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "RENT - We serve a plartform where you can rent clothes at a very low price.",
              style: GoogleFonts.raleway(color: Colors.blue, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "SWAP - Tired of one iteam but don't wanna get rid of it? Swap for sometime and earn !",
              style: GoogleFonts.raleway(color: Colors.blue, fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "DONATE - Help us make the lives of other better by donating your extra clothes !",
              style: GoogleFonts.raleway(color: Colors.blue, fontSize: 18),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "How ReWear Crowd can help you?",
              style: GoogleFonts.raleway(color: Colors.black, fontSize: 24),
            ),
            const SizedBox(
              height: 30,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Column(
            //       children: [
            //         CircleAvatar(
            //           radius: 60,
            //         ),
            //         const SizedBox(
            //           height: 18,
            //         ),
            //         Icon(
            //           Icons.check_box,
            //           color: Colors.greenAccent,
            //           size: 30,
            //         )
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         CircleAvatar(
            //           radius: 60,
            //         ),
            //         const SizedBox(
            //           height: 18,
            //         ),
            //         Icon(
            //           Icons.no_accounts,
            //           color: Colors.redAccent,
            //           size: 30,
            //         )
            //       ],
            //     )
            //   ],
            // )
            Row(
              children: [
                Icon(
                  Icons.check_box,
                  color: Colors.black,
                ),
                Text(
                  "  Cut out add on of landfills",
                  style: GoogleFonts.raleway(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_box,
                  color: Colors.black,
                ),
                Text(
                  "  Be enviornment friendly\n  with recycling",
                  style: GoogleFonts.raleway(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_box,
                  color: Colors.black,
                ),
                Text(
                  "  Budget Friendly",
                  style: GoogleFonts.raleway(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Icon(
                  Icons.check_box,
                  color: Colors.black,
                ),
                Text(
                  "  Be on trend\n  without buying trendy clothes",
                  style: GoogleFonts.raleway(color: Colors.black, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ]),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Who are we?",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
