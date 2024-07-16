import 'package:datn_trung/themes/app_colors.dart';
import 'package:flutter/material.dart';

class BuildInfoItem extends StatelessWidget {
  const BuildInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.content,
  });

  final String label;
  final String content;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  style: const TextStyle(fontSize: 16),
                ),
                Container(
                  height: 1,
                  color: AppColors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
