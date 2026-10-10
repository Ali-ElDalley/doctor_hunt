import 'package:doctor_hunt/apps/core/models/doctor_model.dart';
import 'package:doctor_hunt/apps/core/themes/app_colors.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorListCard extends StatefulWidget {
  final DoctorModel doctorModel;
  final VoidCallback? onTap;

  const DoctorListCard({super.key, required this.doctorModel, this.onTap});

  @override
  State<DoctorListCard> createState() => _DoctorListCardState();
}

class _DoctorListCardState extends State<DoctorListCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.doctorModel.isFavorite;
  }

  @override
  void didUpdateWidget(covariant DoctorListCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.doctorModel.isFavorite != widget.doctorModel.isFavorite) {
      _isFavorite = widget.doctorModel.isFavorite;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        width: 335.w,
        height: 104.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 11.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                width: 82.w,
                height: 82.h,
                child: widget.doctorModel.imageUrl.isEmpty
                    ? Container(
                        color: Colors.grey.shade200,
                        child: Icon(Icons.person, size: 40.sp, color: Colors.grey),
                      )
                    : Image.network(
                        widget.doctorModel.imageUrl,
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey.shade200,
                          child: Icon(Icons.person, size: 40.sp, color: Colors.grey),
                        ),
                      ),
              ),
            ),
            Gap(15.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.doctorModel.name,
                          style: context.medium18Black,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gap(6.w),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _isFavorite = !_isFavorite;
                          });
                        },
                        borderRadius: BorderRadius.circular(12.r),
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 19.sp,
                            color: _isFavorite
                                ? AppColors.danger
                                : AppColors.textPlaceholder,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.doctorModel.specialty,
                    style: context.light14TextSub,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingBarIndicator(
                        rating: widget.doctorModel.rating,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Color(0xFFF6D060)),
                        itemCount: 5,
                        itemSize: 12.sp,
                        unratedColor: Colors.grey.shade300,
                      ),
                      Flexible(
                        child: RichText(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: widget.doctorModel.rating.toStringAsFixed(
                                  1,
                                ),
                                style: context.medium14Black.copyWith(
                                  fontSize: 13.sp,
                                ),
                              ),
                              TextSpan(
                                text:
                                    " (${widget.doctorModel.patientCount} ${tr.popularDoctors.views})",
                                style: context.regular12TextSub.copyWith(
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
