import 'package:get/get.dart';
import 'package:mahjoub_company/database/controllers/cart_db_controller.dart';
import 'package:mahjoub_company/models/cart.dart';
import 'package:mahjoub_company/models/process_response.dart';

class CartGetxController extends GetxController {
  RxList<Cart> cartItems = <Cart>[].obs;
  RxBool loading = false.obs;

  static CartGetxController get to => Get.find<CartGetxController>();
  final CartDbController _dbController = CartDbController();

  @override
  void onInit() {
    read();
    super.onInit();
  }

  double total = 0;
  double quantity = 0;

  Future<ProcessResponse> create(Cart cart) async {
    int index =
    cartItems.indexWhere((element) => element.productId == cart.productId);
    if (index == -1) {
      int newRowId = await _dbController.create(cart);
      if (newRowId != 0) {
        total += cart.total;
        quantity += 1;
        cart.id = newRowId;
        cartItems.add(cart);
      }
      return getResponse(newRowId != 0);
    } else {
      // int quantity = await _productDbController.getQuantity(cart.productId);
      int newCount = cartItems[index].quantity + 1;
      return changeQuantity(index, newCount);
    }
  }

  void read() async {
    loading.value = true;
    cartItems.value = await _dbController.read();
    for (Cart cart in cartItems) {
      total = cart.total;
      quantity += cart.quantity;
    }
    loading.value = false;
  }

  Future<ProcessResponse> changeQuantity(int index, int count,[bool getDown = false]) async {
    bool isDelete = count == 0;
    Cart cart = cartItems[index];
    bool result = isDelete
        ? await _dbController.delete(cart.id)
        : await _dbController.update(cart);
    if (result) {
      if (isDelete) {
        total -= cart.total;
        quantity -= 1;
        cartItems.removeAt(index);
      }else if(getDown){
        cart.quantity = count;
        cart.total = cart.total;
        total -= cart.total;
        quantity -= 1;
        cartItems[index] = cart;
      }
      else {
        cart.quantity = count;
        cart.total = cart.total;
        total += cart.total;
        quantity += 1;
        cartItems[index] = cart;
      }
    }
    return getResponse(result);
  }

  Future<ProcessResponse> clear() async {
    bool cleared = await _dbController.clear();
    if (cleared) {
      total = 0;
      quantity = 0;
      cartItems.clear();
    }
    return getResponse(cleared);
  }

  ProcessResponse getResponse(bool success) {
    return ProcessResponse(
      message:
          success ? 'Operation completed successfully' : 'Operation failed!',
      success: success,
    );
  }
}
