import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';
import '../models/employee.dart';

class EmployeeFormView extends StatelessWidget {
  final Employee? employee;
  final controller = Get.find<EmployeeController>();

  final nameController = TextEditingController();
  final positionController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  EmployeeFormView({this.employee}) {
    if (employee != null) {
      nameController.text = employee!.name;
      positionController.text = employee!.position;
      emailController.text = employee!.email;
      phoneController.text = employee!.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = employee != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "แก้ไขพนักงาน" : "เพิ่มพนักงาน")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: 'ชื่อ')),
          TextField(controller: positionController, decoration: InputDecoration(labelText: 'ตำแหน่ง')),
          TextField(controller: emailController, decoration: InputDecoration(labelText: 'อีเมล')),
          TextField(controller: phoneController, decoration: InputDecoration(labelText: 'เบอร์โทร')),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              final newEmployee = Employee(
                id: employee?.id ?? '',
                name: nameController.text,
                position: positionController.text,
                email: emailController.text,
                phone: phoneController.text,
              );

              if (isEdit) {
                controller.updateEmployee(newEmployee);
              } else {
                controller.addEmployee(newEmployee);
              }

              Get.back();
            },
            child: Text(isEdit ? 'บันทึกการแก้ไข' : 'เพิ่ม'),
          ),
        ]),
      ),
    );
  }
}
