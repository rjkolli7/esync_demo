import 'package:esync_demo/domain/model/body/add_category_body.dart';
import 'package:esync_demo/helper/dialog_helper.dart';
import 'package:esync_demo/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  _AddCategoryPageState createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Get.find<CategoryController>();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: GetPlatform.isMobile
              ? Theme.of(context).primaryColor
              : Colors.transparent,
          elevation: GetPlatform.isMobile ? 8 : 0,
          centerTitle: true,
          automaticallyImplyLeading: GetPlatform.isMobile ? true : false,
          title: const Text('Add Category'),
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
                                    hintText: 'Enter Category Name',
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter category name to continue';
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
                          var result = await controller.addCategory(
                            AddCategoryBody(
                              name: nameController.text,
                              description: descController.text,
                            ),
                          );
                          if (result == 'success') {
                            Get.back(result: true);
                            showErrorDialog(context, 'Success',
                                Exception('Category Added Successfully!'));
                          } else {
                            showErrorDialog(
                                context, 'Failed', Exception(result));
                          }
                        }
                      },
                      title: 'Save Category'),
                  const SizedBox(height: 50),
                ],
              )),
        ),
      );
    });
  }
}
