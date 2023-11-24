import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Model/Model.dart';

class HomeController extends GetxController {
  var userList = <UserModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  Future<void> getUsers() async {
    const String userUrl = "https://jsonplaceholder.typicode.com/photos";
    final response = await http.get(Uri.parse(userUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      userList.value = result.map((e) => UserModel.fromJson(e)).toList();
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }

  // RxList dataList = [].obs ;
  // RxList<productt> dataListt = <productt>[].obs;
  // // String dataList;
  // Future <void> fetchUser() async {
  //   final dio = Dio();
  //
  //   try {
  //     final response =
  //     await dio.get('https://jsonplaceholder.typicode.com/photos');
  //     if (response.statusCode == 200) {
  //       dataListt = response.data;
  //       print("FFFFFFFLLLLL ${response.data}");
  //       print("Dataaaaaaa ${dataListt}");
  //     } else {
  //       print("FFFFFFFyyyy ");
  //     }
  //   } catch (e) {}
  // }
}