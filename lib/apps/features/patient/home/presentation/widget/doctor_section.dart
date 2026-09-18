import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorSection extends StatefulWidget {
  final String title;
  final Widget child;
  final Function()? onSeeAll;

  const DoctorSection({
    super.key,
    required this.title,
    required this.child,
    this.onSeeAll,
  });

  @override
  State<DoctorSection> createState() => _DoctorSectionState();
}

class _DoctorSectionState extends State<DoctorSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.rubik(textStyle: context.medium18Black),
            ),
            widget.onSeeAll != null
                ? GestureDetector(
                    onTap: widget.onSeeAll,
                    child: Row(
                      children: [
                        Text(
                          'See all',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.grey.shade500,
                          size: 18,
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
        const Gap(12),
        widget.child,
      ],
    );
  }
}
