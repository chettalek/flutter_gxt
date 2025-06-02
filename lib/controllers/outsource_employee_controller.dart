import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../models/outsource_employee.dart';

class OutsourceEmployeeController extends GetxController {
  var outsourceList = <OutsourceEmployee>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  final Dio _dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchOutsourceEmployees();
  }

  Future<void> fetchOutsourceEmployees() async {
    isLoading(true);
    try {
      final response =
          await _dio.get('https://fake-json-api.mock.beeceptor.com/users');
      final List<dynamic> data = response.data;
      outsourceList.value =
          data.map((e) => OutsourceEmployee.fromJson(e)).toList();
      
    } catch (e) {
      errorMessage.value = 'เกิดข้อผิดพลาดในการโหลดข้อมูล';
    } finally {
      isLoading(false);
    }
  }

  OutsourceEmployee? getById(int id) {
    return outsourceList.firstWhereOrNull((e) => e.id == id);
  }
}
