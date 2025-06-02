// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../controllers/employee_controller.dart';
// import 'employee_form_view.dart';

// class EmployeeDetailView extends StatelessWidget {
//   final String employeeId;
//   final controller = Get.find<EmployeeController>();

//   EmployeeDetailView({required this.employeeId});

//   @override
//   Widget build(BuildContext context) {
//     var employee = controller.getEmployeeById(employeeId);

//     if (employee == null)
//       return Scaffold(body: Center(child: Text('ไม่พบข้อมูล')));

//     return Scaffold(
//       appBar: AppBar(title: Text('รายละเอียดพนักงาน')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(employee.name, style: TextStyle(fontSize: 20)),
//             Text('ตำแหน่ง: ${employee.position}'),
//             Text('อีเมล: ${employee.email}'),
//             Text('เบอร์โทร: ${employee.phone}'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () =>
//                    Get.to(() => EmployeeFormView(employee: employee))?.then((onValue){
//                     employee = controller.getEmployeeById(employeeId);
//                   }),
//               child: Text('แก้ไข'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/employee_controller.dart';
import 'employee_form_view.dart';

class EmployeeDetailView extends StatelessWidget {
  final String employeeId;
  final controller = Get.find<EmployeeController>();

  EmployeeDetailView({required this.employeeId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('รายละเอียดพนักงาน')),
      body: Obx(() {
        // ดึงข้อมูลใหม่ทุกครั้งที่ controller เปลี่ยน
        final employee = controller.getEmployeeById(employeeId);

        if (employee == null) {
          return Center(child: Text('ไม่พบข้อมูล'));
        }

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(employee.name, style: TextStyle(fontSize: 20)),
              Text('ตำแหน่ง: ${employee.position}'),
              Text('อีเมล: ${employee.email}'),
              Text('เบอร์โทร: ${employee.phone}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final result =
                      await Get.to(() => EmployeeFormView(employee: employee));
                  if (result == true) {
                    controller.employeeList
                        .refresh(); // ไม่จำเป็นถ้า update ใช้ refresh แล้ว
                  }
                },
                child: Text('แก้ไข'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
