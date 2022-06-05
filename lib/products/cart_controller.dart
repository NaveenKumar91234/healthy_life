import 'package:get/get.dart';
import '../../../models/product.dart';

class CartController extends GetxController {
  List<Product> selectedProducts = <Product>[].obs;

  get products => null;
  void addProductToCart(Product product) {
    selectedProducts.add(product);
  }

  void removeProductsFromCart(Product product) {
    selectedProducts.remove(product);
  }

  double get totalCost => selectedProducts.fold(
      0, (total, selectedProduct) => total + selectedProduct.price);
}
