import 'package:charging_service/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChargingScreen extends StatelessWidget {
  const ChargingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          title: const Center(
              child: Text(
            'Dịch vụ sạc',
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: const Color(0xFF0C2964),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trạm sạc số 1',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                height: 1,
                color: AppColors.grey,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Center(
                child: Container(
                  height: 175,
                  width: 175,
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
                        axisLineStyle: const AxisLineStyle(
                            thickness: 10, color: Colors.green),
                        ranges: <GaugeRange>[
                          GaugeRange(
                            startValue: 0,
                            endValue: 360,
                            color: Colors.green,
                            startWidth: 5,
                            endWidth: 5,
                          ),
                        ],
                        annotations: const <GaugeAnnotation>[
                          GaugeAnnotation(
                            widget: Center(
                              child: Column(
                                children: [
                                  Icon(Icons.flash_on,
                                      size: 40, color: Colors.green),
                                ],
                              ),
                            ),
                            angle: 90,
                            positionFactor: 0.4,
                          ),
                          GaugeAnnotation(
                              widget: Text(
                                ' Đang sạc',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.green),
                              ),
                              angle: 90,
                              positionFactor: 0.1),
                          GaugeAnnotation(
                              widget: Text(
                                ' 100kWh',
                                style: TextStyle(
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Thời gian sử dụng:',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    ' 2hr 30 min',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Năng lượng:',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    '100kWh',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Công suất:',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    '70W',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                height: 1,
                color: AppColors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
