import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/outsource_employee_controller.dart';

class OutsourceDetailView extends StatelessWidget {
  final int id;
  final controller = Get.find<OutsourceEmployeeController>();

  OutsourceDetailView({required this.id});

  @override
  Widget build(BuildContext context) {
    final emp = controller.getById(id);
    if (emp == null) return Scaffold(body: Center(child: Text('ไม่พบข้อมูล')));

    return Scaffold(
      appBar: AppBar(title: Text(emp.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              emp.photo,
              width: 100,
              height: 100,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 100, color: Colors.grey);
              },
            ),
            SizedBox(height: 10),
            Text('ชื่อผู้ใช้: ${emp.username}'),
            Text('บริษัท: ${emp.company}'),
            Text('อีเมล: ${emp.email}'),
            Text('โทร: ${emp.phone}'),
            Text(
                'ที่อยู่: ${emp.address}, ${emp.state}, ${emp.country}, ${emp.zip}'),
          ],
        ),
      ),
    );
  }
}
