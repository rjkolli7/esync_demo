import 'package:esync_demo/controllers/product_controller.dart';
import 'package:esync_demo/domain/model/response/products_response.dart';
import 'package:esync_demo/ui/product/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  ProductsPageState createState() => ProductsPageState();
}

class ProductsPageState extends State<ProductsPage> {
  List<Product>? products;
  bool isGrid = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    Get.find<ProductController>().getProducts().then((value) {
      setState(() {
        products = value.products;
      });
    }, onError: (error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Visibility(
            visible: GetPlatform.isWeb,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: MaterialButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                shape: const CircleBorder(),
                color: Colors.white,
                elevation: 8,
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Icon(isGrid ? Icons.list : Icons.grid_view)),
              ),
            ),
          ),
          isGrid
              ? GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products?.length ?? 0,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(
                      product: products![index],
                    );
                  },
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(products?.length ?? 0, (index) {
                    return ListTile(
                      title: ProductItem(
                        product: products![index],
                      ),
                    );
                  }),
                ),
        ],
      ),
    );
  }
}
