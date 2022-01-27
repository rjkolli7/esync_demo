import 'package:esync_demo/domain/model/response/products_response.dart';
import 'package:esync_demo/helper/test_styles.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                product.name ?? '#product_name',
                style: TextStyles.listTitleTextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Category: ${product.categoryName ?? '#category_name'}',
                style: TextStyles.listSubTitleTextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Short Desc: ${product.shortDescription ?? '#short_desc'}',
                style: TextStyles.listMidTitleTextStyle,
              ),
              const SizedBox(height: 8),
              Text(
                'Desc: ${product.description ?? '#desc'}',
                style: TextStyles.listMidTitleTextStyle,
              ),
              const SizedBox(height: 8),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'Price: ${product.price ?? '0.0'}',
                  style: TextStyles.listSmallTitleTextStyle,
                ),
              ),
              const SizedBox(height: 8),
            ],
          )),
    );
  }
}
