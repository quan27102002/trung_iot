import 'package:datn_trung/model/user_model.dart';
import 'package:datn_trung/provider/user_provider.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/widget/drawer_widget.dart';
import 'package:datn_trung/widget/payment_detail.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  double totalEnergy = 0;
  int totalTime = 0;
  Future<void> _initData(UserModel data) async {
    DatabaseReference energy = FirebaseDatabase.instance
        .ref('/USER/${data.uid}')
        .child('total_energy');
    DatabaseReference time =
        FirebaseDatabase.instance.ref('/USER/${data.uid}').child('total_time');

    energy.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        totalEnergy = double.parse(data.toString());
      });
    });

    time.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        totalTime = int.parse(data.toString());
      });
    });
  }

  @override
  void initState() {
    super.initState();
    UserModel data = context.read<UserProvider>().userData;
    _initData(data);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          title: const Text(
            'Thanh toán',
            style: TextStyle(color: Colors.white),
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
          backgroundColor: const Color(0xFF0C2964),
        ),
        drawer: Drawer(
          child: DrawWidget(
            user: context.read<UserProvider>().userData,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentDetailRow(
                icon: Icons.flash_on,
                label: 'Tổng năng lượng tiêu thụ',
                value: totalEnergy.toString() + "kWh",
              ),
              const SizedBox(
                height: 8,
              ),
              PaymentDetailRow(
                icon: Icons.timer,
                label: 'Tổng thời gian sử dụng',
                value: totalTime.toString() + "s",
              ),
              const SizedBox(
                height: 8,
              ),
              PaymentDetailRow(
                icon: Icons.payment,
                label: 'Thanh toán',
                value: '${totalEnergy * 3000} vnđ',
              ),
              const SizedBox(
                height: 32,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 1,
                      color: AppColors.grey,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Quét QR để thanh toán',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyQR),
                    ),
                    Image.asset(
                      'lib/res/images/qr.png',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
