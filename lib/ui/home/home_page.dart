import 'package:esync_demo/helper/string_helper.dart';
import 'package:esync_demo/routes/app_routes.dart';
import 'package:esync_demo/ui/home/home_page_type.dart';
import 'package:esync_demo/ui/product/add_category_page.dart';
import 'package:esync_demo/ui/product/add_product_page.dart';
import 'package:esync_demo/ui/product/product_page.dart';
import 'package:esync_demo/ui/profile/profile_page.dart';
import 'package:esync_demo/widgets/web_menu_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/theme_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool floatExtended = false;
  HomePageType homePage = HomePageType.products;
  int currentIndex = 0;
  final _productKey = GlobalKey<ProductsPageState>();
  Widget getCurrentPage() {
    switch (homePage) {
      case HomePageType.profile:
        return const ProfilePage();
      case HomePageType.products:
      default:
        return ProductsPage(
          key: _productKey,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GetPlatform.isWeb
          ? WebMenuBar(
              onMenuButtonSelect: (page) {
                setState(() {
                  homePage = page;
                });
              },
            )
          : AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).primaryColor,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      GetBuilder<ThemeController>(builder: (themeController) {
                    return MenuButton(
                      icon: themeController.darkTheme
                          ? Icons.dark_mode
                          : Icons.light_mode,
                      title: 'Theme',
                      onTap: () {
                        themeController.toggleTheme();
                      },
                    );
                  }),
                )
              ],
            ),
      bottomNavigationBar: GetPlatform.isMobile
          ? BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag),
                  label: StringHelper.products,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: StringHelper.profile,
                ),
              ],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white.withOpacity(0.5),
              currentIndex: currentIndex,
              backgroundColor: Theme.of(context).primaryColor,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                  homePage =
                      index == 1 ? HomePageType.profile : HomePageType.products;
                });
              },
            )
          : const SizedBox(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
              visible: floatExtended,
              child: FloatingActionButton.extended(
                label: const Text('Add Product'),
                onPressed: () async {
                  setState(() {
                    floatExtended = !floatExtended;
                  });
                  if (GetPlatform.isWeb) {
                    await showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            content: Container(
                              width: 500,
                              height: context.height - 200,
                              margin: const EdgeInsets.symmetric(vertical: 100),
                              child: const AddProductPage(),
                            ),
                          );
                        }).then((value) {
                      _productKey.currentState?.getData();
                    });
                  } else {
                    var result = await Get.toNamed(Routes.addProduct);
                    if (result == true && homePage == HomePageType.products) {
                      _productKey.currentState?.getData();
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 8),
            Visibility(
              visible: floatExtended,
              child: FloatingActionButton.extended(
                label: const Text('Add Category'),
                onPressed: () async {
                  setState(() {
                    floatExtended = !floatExtended;
                  });
                  if (GetPlatform.isWeb) {
                    await showDialog(
                        context: context,
                        builder: (c) {
                          return AlertDialog(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            insetPadding: EdgeInsets.zero,
                            backgroundColor: Colors.transparent,
                            content: Container(
                              width: 500,
                              height: context.height - 200,
                              margin: const EdgeInsets.symmetric(vertical: 100),
                              child: const AddCategoryPage(),
                            ),
                          );
                        }).then((value) {});
                  } else {
                    Get.toNamed(Routes.addCategory);
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
            FloatingActionButton(
              child: floatExtended
                  ? const Icon(Icons.close)
                  : const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  floatExtended = !floatExtended;
                });
              },
            )
          ],
        ),
      ),
      body: homePage == HomePageType.profile
          ? Center(
              child: body(),
            )
          : body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            width: GetPlatform.isWeb
                ? homePage == HomePageType.profile
                    ? 400
                    : double.infinity
                : double.infinity,
            padding: GetPlatform.isWeb
                ? homePage == HomePageType.profile
                    ? EdgeInsets.zero
                    : const EdgeInsets.symmetric(horizontal: 100)
                : const EdgeInsets.symmetric(horizontal: 20),
            child: getCurrentPage(),
          )
        ],
      ),
    );
  }
}
