import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Handwerker! ",
                style: GoogleFonts.rubik(textStyle: context.regular20White),
              ),
              Text(
                "Find Your Doctor",
                style: GoogleFonts.rubik(textStyle: context.bold26White),
              ),
            ],
          ),
          const CircleAvatar(
            radius: 32,
            backgroundImage: NetworkImage(
              "https://randomuser.me/api/portraits/women/16.jpg",
            ),
          ),
        ],
      ),
    );
  }
}
