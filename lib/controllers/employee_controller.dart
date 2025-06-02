import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import '../models/employee.dart';

class EmployeeController extends GetxController {
  var employeeList = <Employee>[].obs;

  final _uuid = Uuid();

  @override
  void onInit() {
    super.onInit();
    _loadDummyData();
  }

  void _loadDummyData() {
    employeeList.value = [
      Employee(
        id: _uuid.v4(),
        name: "Moises Wehner",
        position: "Mobile Developer",
        email: "Ross.Stehr@gmail.com",
        phone: "0888888888",
      ),
      Employee(
        id: _uuid.v4(),
        name: "Front-End Developer",
        position: "Feil - Kutch",
        email: "Feil@gmail.com",
        phone: "0899999999",
      ),
    ];
  }

  void addEmployee(Employee employee) {
    employee.id = _uuid.v4();
    employeeList.add(employee);
  }

  void updateEmployee(Employee updated) {
    int index = employeeList.indexWhere((e) => e.id == updated.id);
    if (index != -1) {
      employeeList[index] = updated;
    }
  }

  void deleteEmployee(String id) {
    employeeList.removeWhere((e) => e.id == id);
  }

  Employee? getEmployeeById(String id) {
    return employeeList.firstWhereOrNull((e) => e.id == id);
  }
}
