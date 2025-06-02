import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';
import 'employee_detail_view.dart';
import 'employee_form_view.dart';

class EmployeeListView extends StatelessWidget {
  final EmployeeController controller = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("รายชื่อพนักงาน")),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.employeeList.length,
          itemBuilder: (_, index) {
            final emp = controller.employeeList[index];
            return ListTile(
              title: Text(emp.name),
              subtitle: Text(emp.position),
              onTap: () => Get.to(() => EmployeeDetailView(employeeId: emp.id)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => controller.deleteEmployee(emp.id),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.to(() => EmployeeFormView()),
      ),
    );
  }
}
