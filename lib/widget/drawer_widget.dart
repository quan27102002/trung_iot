import 'package:datn_trung/app/app_routers.dart';
import 'package:datn_trung/model/user_model.dart';
import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawWidget extends StatelessWidget {
  final UserModel user;
  const DrawWidget({super.key, required this.user});

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
              CircleAvatar(
                radius: 40,
                child: ClipOval(
                  child: Image.asset(
                    AppImages.defaultAvatar,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                user.name.toString(),
                style: AppFonts.quicksandSemi600(
                  16,
                  AppColors.grey500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('UID Thẻ: ${user.uid}'),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.account_circle),
          title: Text('Thông tin cá nhân',
              style: AppFonts.quicksandSemi600(
                16,
                AppColors.grey500,
              )),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouters.profileScreen,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.charging_station_rounded),
          title: Text('Dịch vụ sạc',
              style: AppFonts.quicksandSemi600(
                16,
                AppColors.grey500,
              )),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouters.chargeScreen,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.payment),
          title: Text('Thanh toán',
              style: AppFonts.quicksandSemi600(
                16,
                AppColors.grey500,
              )),
          onTap: () {
            Navigator.pushNamed(
              context,
              AppRouters.paymentScreen,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout_rounded),
          title: Text('Đăng xuất',
              style: AppFonts.quicksandSemi600(
                16,
                AppColors.grey500,
              )),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouters.loginScreen,
              (Route<dynamic> route) => false,
            );
          },
        ),
      ],
    );
  }
}
