import 'package:charging_service/theme/app_color.dart';
import 'package:charging_service/widgets/Paymen_detail.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: AppColors.blue,
          title: const Text(
            'Thanh toán',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaymentDetailRow(
                  icon: Icons.flash_on, label: 'Đã Sạc', value: '11KWh'),
              const SizedBox(height: 8),
              const PaymentDetailRow(
                  icon: Icons.timer, label: 'Thời gian', value: '2hr 30min'),
              const SizedBox(height: 8),
              const PaymentDetailRow(
                  icon: Icons.payment,
                  label: 'Thanh toán',
                  value: '200.000 vnđ'),
              const SizedBox(height: 32),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 1,
                      color: AppColors.grey,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Quét QR để thanh toán',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.greyQR),
                    ),
                    Image.asset('images/qr.png')
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
