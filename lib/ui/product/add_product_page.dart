import 'package:esync_demo/controllers/product_controller.dart';
import 'package:esync_demo/domain/model/body/add_product_body.dart';
import 'package:esync_demo/domain/model/response/category_response.dart';
import 'package:esync_demo/helper/logger_utils.dart';
import 'package:esync_demo/helper/test_styles.dart';
import 'package:esync_demo/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';
import '../../helper/dialog_helper.dart';
import '../../helper/string_helper.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final _categoryKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final descController = TextEditingController();
  final shortDescController = TextEditingController();
  final priceController = TextEditingController();
  List<Category>? categories;
  Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    Get.find<CategoryController>().getCategories().then((value) {
      Logger.write(value.toString());
      setState(() {
        categories = value.categories;
      });
    });
    Get.find<ProductController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: GetPlatform.isMobile
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            elevation: GetPlatform.isMobile ? 8 : 0,
            centerTitle: true,
            automaticallyImplyLeading: GetPlatform.isMobile ? true : false,
            title: const Text('Add Product'),
          ),
          body: Center(
            child: Container(
                width: GetPlatform.isWeb ? 500 : double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Product Name',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter product name to continue';
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: shortDescController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Short Description',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter short description to continue';
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: descController,
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Description',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter description to continue';
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    key: _categoryKey,
                                    controller: categoryController,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Select Category ',
                                    ),
                                    onTap: () {
                                      if (categories != null) {
                                        selectCategory();
                                      } else {
                                        Get.showSnackbar(
                                          GetSnackBar(
                                            backgroundColor: Theme.of(context)
                                                .secondaryHeaderColor,
                                            snackPosition: SnackPosition.TOP,
                                            message: 'No Categories To Select',
                                            duration:
                                                const Duration(seconds: 3),
                                          ),
                                        );
                                      }
                                    },
                                    validator: (value) {
                                      if (categories == null) {
                                        return 'No Categories To Select';
                                      }
                                      if (value!.isEmpty) {
                                        return 'Select Category to continue';
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: priceController,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType:
                                        const TextInputType.numberWithOptions(
                                            decimal: true),
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Price ',
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter price to continue';
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    StyledMaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            var result = await controller.addProduct(
                              AddProductBody(
                                name: nameController.text,
                                description: descController.text,
                                shortDescription: shortDescController.text,
                                price: priceController.text,
                                categoryId: selectedCategory?.id ?? -1,
                                categoryName: selectedCategory?.name ?? '',
                              ),
                            );
                            if (result == 'success') {
                              Get.back(result: true);
                              showErrorDialog(context, 'Success',
                                  Exception('Product Added Successfully!'));
                            } else {
                              showErrorDialog(
                                  context, 'Failed', Exception(result));
                            }
                          }
                        },
                        title: 'Save Product'),
                    const SizedBox(height: 50),
                  ],
                )),
          ),
        ),
      );
    });
  }

  void selectCategory() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Select Category',
            style: TextStyles.titleTextStyle,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: List.generate(categories?.length ?? 0, (index) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      setState(() {
                        selectedCategory = categories![index];
                        categoryController.text = categories![index].name ?? '';
                      });
                      Navigator.of(context).pop();
                    });
                  },
                  child: Text(
                    categories![index].name ?? '',
                    style: TextStyles.regularTextStyle,
                  ),
                );
              }),
            ),
          ),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                StringHelper.cancel,
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        );
      },
    );
  }
}
