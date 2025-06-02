import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/outsource_employee_controller.dart';
import 'outsource_detail_view.dart';

class OutsourceListView extends StatelessWidget {
  final controller = Get.put(OutsourceEmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('รายชื่อพนักงาน Outsource')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        } else {
          return ListView.builder(
            itemCount: controller.outsourceList.length,
            itemBuilder: (_, index) {
              final emp = controller.outsourceList[index];
              return ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(emp.photo)),
                title: Text(emp.name),
                //subtitle: Text(emp.company),
                onTap: () => Get.to(() => OutsourceDetailView(id: emp.id)),
              );
              
            },
          );
        }
      }),
    );
  }
}
