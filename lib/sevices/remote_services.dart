import 'package:http/http.dart' as http;
import 'package:rest_api_with_getx_sample_project/models/product.dart';

class RemoteServices {
  // We don't want to create each time when we make a call
  // That way it will open the connection and close the connection
  // It is not a good practise, so that's why we use statc here
  static var client = http.Client();
  static Future<List<Product>> fetchProducts() async {
    var response = await client.get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
    if (response.statusCode == 200) {
      // Success
      var jsonString = response.body;
      // Parse JSON to List of Procuts
      return productFromJson(jsonString);
    } else {
      // Show Error Message
      return null;
    }
  }
}
