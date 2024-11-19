import 'package:api_getx/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Homecontroller extends GetxController {
  bool isLoading = false;
  List<Product>? products;
  Homecontroller() {
    fetchProducts();
  }
  fetchProducts() async {
    isLoading = true;
    update();
    final response = await http.get(Uri.parse(
        "https://mansharcart.com/api/products/category/139/key/123456789"));
    if (response.statusCode == 200) {
      var res = productResModelFromJson(response.body);
      products = res.products;
      isLoading = false;
      update();
    }
  }
}
