import 'package:datn_trung/themes/app_colors.dart';
import 'package:datn_trung/widget/build_info_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thông tin cá nhân'),
        backgroundColor: AppColors.blue,
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.edit_document, color: Colors.orange),
              ],
            ),
            BuildInfoItem(
              icon: Icons.person,
              label: 'Họ và tên',
              content: 'Đào Quang Trung',
            ),
            
            BuildInfoItem(
              icon: Icons.location_on,
              label: 'Địa chỉ',
              content: '51 Tương Mai, Hoàng Mai, Hà Nội',
            ),
            BuildInfoItem(
              icon: Icons.phone,
              label: 'Số điện thoại',
              content: '+84 333831566',
            ),
            BuildInfoItem(
              icon: Icons.credit_card,
              label: 'UID Thẻ',
              content: '43A158F6',
            ),
          ],
        ),
      ),
    );
  }
}
