import 'package:get/get.dart';
import 'package:mahjoub_company/api/cities_api_controller.dart';
import 'package:mahjoub_company/models/city.dart';
import 'package:mahjoub_company/models/process_response.dart';

class CitiesGetxController extends GetxController {
  RxList<City> citiesItem = <City>[].obs;
  RxBool loading = false.obs;

  static CitiesGetxController get to => Get.find<CitiesGetxController>();

  @override
  void onInit() {
    read();
    super.onInit();
  }


  void read() async {
    loading.value = true;
    citiesItem.value = await CitiesApiController().getCities();
    loading.value = false;
  }

  Future<ProcessResponse> create(City city) async {
    citiesItem.add(city);
    return ProcessResponse(message: city.nameAr, success: true);
  }
}
