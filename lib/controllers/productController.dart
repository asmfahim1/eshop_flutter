import 'package:eshop_with_get/services/remote_services.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../model/products.dart';

class ProductsController extends GetxController{
  var ProductList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async{
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();
      if(products != null){
        ProductList.value = products;
      }
    } finally {
      isLoading(false);
    }

  }
}
