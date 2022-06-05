import 'package:flutter_application_1/products/product_service.dart';
import 'package:get/get.dart';
import '../../../models/product.dart';

class ShoppingController extends GetxController {
  List<Product> products = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    getProductDetails();
  }

  void getProductDetails() async {
    products.assignAll(ProductService().getProducts().toList());
  }
}
