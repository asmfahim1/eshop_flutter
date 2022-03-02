import 'package:eshop_with_get/controllers/productController.dart';
import 'package:eshop_with_get/views/products_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final ProductsController _productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("eProducts"),
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back_ios,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children:  [
          Padding(
              padding: EdgeInsets.all(16),
            child: Row(
              children:  [
                const Expanded(
                  child: Text(
                    "ShopX",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.view_list_rounded)
                ),
                IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.widgets_outlined),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return _productsController.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                      itemCount: _productsController.ProductList.length,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 10,
                      itemBuilder: (context, index){
                        return ProductTile(_productsController.ProductList[index]);
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  );
              }
            ),
          ),
        ],
      ),
    );
  }
}
