import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DrawWidget extends StatelessWidget {
  const DrawWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF0C2964),
                Color(0xFFFFFFFF)
              ], // Define your colors here
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                AppImages.defaultAvatar,
                height: 50,
                width: 50,
              ),
              Text(
                'Đào Quang Trung',
                style: AppFonts.quicksandSemi600(
                  16,
                  AppColors.grey500,
                ),
              ),
              Text(
                'Tương Mai, Hai Bà Trưng, Hà Nội',
                style: AppFonts.quicksandMedium500(
                  14,
                  AppColors.grey500,
                ),
              ),
              Text(
                '03459658999',
                style: AppFonts.quicksandMedium500(
                  14,
                  AppColors.grey500,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
          onTap: () {
            // Handle the tap
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            // Handle the tap
          },
        ),
      ],
    );
  }
}
