import 'dart:async';

import 'package:datn_trung/model/user_model.dart';
import 'package:datn_trung/provider/user_provider.dart';
import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/widget/drawer_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChargingScreen extends StatefulWidget {
  const ChargingScreen({super.key});

  @override
  State<ChargingScreen> createState() => _ChargingScreenState();
}

class _ChargingScreenState extends State<ChargingScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  double currentData = 0;
  double energyData = 0;
  double powerData = 0;
  double timeData = 0;
  double voltageData = 0;
  UserModel? data;
  Future<UserModel> fetchDataFromFirestore() async {
    List<UserModel> usersList = [];
    String email = context.read<UserProvider>().emailUser;
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('user');

      // Lấy snapshot của collection
      QuerySnapshot querySnapshot = await collectionReference.get();

      // Duyệt qua từng document trong snapshot và thêm vào dataList
      for (var doc in querySnapshot.docs) {
        usersList
            .add(UserModel.fromFirestore(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching data: $e");
      }
    }
    setState(() {});
    data = usersList.firstWhere((e) => e.email == email);
    // ignore: use_build_context_synchronously
    context.read<UserProvider>().saveUser(data!);
    return data!;
  }

  Future<void> _initData(UserModel data) async {
    DatabaseReference current =
        FirebaseDatabase.instance.ref('/USER/${data.uid}').child('current');
    DatabaseReference energy =
        FirebaseDatabase.instance.ref('/USER/${data.uid}').child('energy');
    DatabaseReference power =
        FirebaseDatabase.instance.ref('/USER/${data.uid}').child('power');
    DatabaseReference time =
        FirebaseDatabase.instance.ref('/USER/${data.uid}').child('time');
    DatabaseReference voltage =
        FirebaseDatabase.instance.ref('/USER/${data.uid}').child('voltage');
    current.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        currentData = double.parse(data.toString());
      });
    });

    energy.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        energyData = double.parse(data.toString());
      });
    });
    power.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        powerData = double.parse(data.toString());
      });
    });
    time.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        timeData = double.parse(data.toString());
      });
    });
    voltage.onValue.listen((event) {
      var data = event.snapshot.value;
      setState(() {
        voltageData = double.parse(data.toString());
      });
    });
  }

  @override
  void initState() {
    _initializeData();

    super.initState();
  }

  Future<void> _initializeData() async {
    // Chờ cho đến khi fetchDataFromFirestore hoàn thành
    UserModel user = await fetchDataFromFirestore();
    // Sau đó gọi _initData
    await _initData(user);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          title: const Text(
            'Dịch vụ sạc',
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentData == 0
                    ? const SizedBox.shrink()
                    : const Text(
                        'Trạm sạc số 1',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                const SizedBox(height: 20),
                currentData == 0
                    ? const SizedBox.shrink()
                    : Container(
                        height: 1,
                        color: AppColors.grey,
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: SfRadialGauge(
                      axes: <RadialAxis>[
                        RadialAxis(
                          radiusFactor: 1,
                          startAngle: -90,
                          endAngle: 270,
                          minimum: 0,
                          maximum: 360,
                          showLabels: false,
                          showTicks: false,
                          axisLineStyle: AxisLineStyle(
                            thickness: 10,
                            color:
                                currentData == 0 ? Colors.grey : Colors.green,
                          ),
                          ranges: <GaugeRange>[
                            GaugeRange(
                              startValue: 0,
                              endValue: 360,
                              color:
                                  currentData == 0 ? Colors.grey : Colors.green,
                              startWidth: 5,
                              endWidth: 5,
                            ),
                          ],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(
                              widget: Center(
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.flash_on,
                                      size: 40,
                                      color: currentData == 0
                                          ? Colors.grey
                                          : Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              angle: 90,
                              positionFactor: 0.4,
                            ),
                            GaugeAnnotation(
                              widget: Text(
                                currentData == 0
                                    ? "Không sử dụng"
                                    : ' Đang sạc',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: currentData == 0
                                      ? Colors.grey
                                      : Colors.green,
                                ),
                              ),
                              angle: 90,
                              positionFactor: 0.1,
                            ),
                            GaugeAnnotation(
                                widget: currentData == 0
                                    ? const SizedBox.shrink()
                                    : Text(
                                        '${energyData}kWh',
                                        style: const TextStyle(
                                            fontSize: 24,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                angle: 90,
                                positionFactor: 0.5),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                currentData == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Thời gian sử dụng:',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '${timeData}h',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                const SizedBox(height: 10),
                currentData == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Năng lượng:',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            '${energyData}kWh',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                const SizedBox(height: 10),
                currentData == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Công suất:',
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            '${powerData}W',
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                currentData == 0
                    ? const SizedBox.shrink()
                    : Container(
                        height: 1,
                        color: AppColors.grey,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
