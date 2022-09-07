import 'package:get/get.dart';
import 'package:mahjoub_company/api/addresses_api_controller.dart';
import 'package:mahjoub_company/models/address.dart';
import 'package:mahjoub_company/models/process_response.dart';

class AddressesGetxController extends GetxController {
  RxList<Address> addressItem = <Address>[].obs;
  RxBool loading = false.obs;

  static AddressesGetxController get to => Get.find<AddressesGetxController>();

  @override
  void onInit() {
    read();
    super.onInit();
  }


  void read() async {
    loading.value = true;
    addressItem.value = await AddressesApiController().getAddress();
    loading.value = false;
  }

  Future<ProcessResponse> create(Address address) async {
    addressItem.add(address);
    return ProcessResponse(message: address.name!, success: true);
  }
}
