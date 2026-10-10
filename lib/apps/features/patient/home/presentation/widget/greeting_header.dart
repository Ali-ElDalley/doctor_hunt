import 'dart:io';

import 'package:doctor_hunt/apps/core/extensions/get_it_extensions.dart';
import 'package:doctor_hunt/apps/core/utils/get_it_service.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/user_bloc/user_cubit.dart';
import 'package:doctor_hunt/apps/features/patient/home/presentation/controller/user_bloc/user_state.dart';
import 'package:doctor_hunt/generated/strings.g.dart';
import 'package:doctor_hunt/generated/style_atoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  Future<void> _avatarTapped(BuildContext context) async {
    final cubit = context.read<UserCubit>();
    if (cubit.state is! UserLoaded) return;
    final pickedFile = await getIt.imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      imageQuality: 80,
    );
    if (pickedFile == null) return;
    await cubit.updateAvatar(File(pickedFile.path));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserAvatarFaild) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final String userName;
        final String? avatarUrl;

        if (state is UserLoaded) {
          userName = state.user.fullName;
          avatarUrl = state.user.avatarUrl;
        } else {
          userName = '';
          avatarUrl = null;
        }

        return Padding(
          padding: EdgeInsetsDirectional.only(
            top: 36.h,
            start: 20.w,
            end: 20.w,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Skeletonizer(
                  enabled: state is UserLoading || state is UserInitial,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tr.home.greeting(name: userName),
                        style: context.light20White,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        tr.home.title,
                        style: context.bold26White,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () => _avatarTapped(context),
                child: ClipOval(
                  child: state is UserAvatarUploading
                      ? CircleAvatar(
                          radius: 30.r,
                          child: CircularProgressIndicator(),
                        )
                      : avatarUrl != null && avatarUrl.isNotEmpty
                      ? Image.network(
                          avatarUrl,
                          width: 60.r,
                          height: 60.r,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              CircleAvatar(
                                radius: 30.r,
                                child: Icon(Icons.person, size: 30.r),
                              ),
                        )
                      : CircleAvatar(
                          radius: 30.r,
                          child: Icon(Icons.person, size: 30.r),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
