import 'package:datn_trung/res/fonts/app_fonts.dart';
import 'package:datn_trung/res/images/app_images.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/widget/donut_chart_widget.dart';
import 'package:datn_trung/widget/item_widget.dart';
import 'package:datn_trung/widget/item_widget2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool connect = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0C2964),
        title: Text(
          "Quản lý dịch vụ",
          style: AppFonts.quicksand600(
            18,
            Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.calendar_view_day_outlined,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0CE8A6),
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
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Kết nối",
                        style: AppFonts.quicksand700(
                          16,
                          AppColors.grey500,
                        ),
                      ),
                      Switch.adaptive(
                        activeColor: AppColors.kPrimary,
                        applyCupertinoTheme: false,
                        value: connect,
                        onChanged: (bool value) {
                          setState(() {
                            connect = !connect;
                          });
                        },
                      ),
                    ],
                  ),
                  ItemWidget(
                    nameItems: "Ngày chốt số",
                    number: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    colorText: AppColors.grey400.withOpacity(0.6),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemWidget(
                  nameItems: "Điện áp",
                  number: "220 V",
                  colorText: Colors.orangeAccent,
                ),
                ItemWidget(
                  nameItems: "Dòng điện",
                  number: "0.2 A",
                  colorText: Colors.blue,
                ),
                ItemWidget(
                  nameItems: "Công suất",
                  number: "40 W",
                  colorText: Colors.green,
                ),
                ItemWidget(
                  nameItems: "Tần số",
                  number: "50 Hz",
                  colorText: Color.fromARGB(255, 233, 224, 147),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const DonutWidgetChart(
              value: 16,
              totalValue: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemWidget2(
                  nameItems: "Trạm sạc số: ",
                  number: "   1     ",
                ),
                ItemWidget2(
                  nameItems: "Trạng thái: ",
                  number: "Đang sạc",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
