
import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'charge_screen.dart';
import 'payment_screen.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const ChargingScreen(),
    const PaymentScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.charging_station),
            label: 'Sạc pin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Thanh toán',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
