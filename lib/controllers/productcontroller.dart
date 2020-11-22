import 'package:get/state_manager.dart';
import 'package:rest_api_with_getx_sample_project/models/product.dart';
import 'package:rest_api_with_getx_sample_project/sevices/remote_services.dart';

class ProductController extends GetxController {
  var isProductsLoading = true.obs;
  var productList = List<Product>().obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isProductsLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
        isProductsLoading(false);
      }
    } finally {
      // ...
    }
  }
}
