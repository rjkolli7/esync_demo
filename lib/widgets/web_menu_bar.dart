import 'package:esync_demo/controllers/theme_controller.dart';
import 'package:esync_demo/helper/dialog_helper.dart';
import 'package:esync_demo/helper/test_styles.dart';
import 'package:esync_demo/ui/home/home_page_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/string_helper.dart';

class WebMenuBar extends StatelessWidget implements PreferredSizeWidget {
  final Function(HomePageType) onMenuButtonSelect;
  const WebMenuBar({Key? key, required this.onMenuButtonSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MenuButton(
            icon: Icons.shopping_bag,
            title: StringHelper.products,
            onTap: () {
              onMenuButtonSelect(HomePageType.products);
            },
          ),
          const SizedBox(width: 40),
          MenuButton(
            icon: Icons.person,
            title: StringHelper.profile,
            onTap: () {
              onMenuButtonSelect(HomePageType.profile);
            },
          ),
          const SizedBox(width: 40),
          MenuButton(
            icon: Icons.logout,
            title: StringHelper.logout,
            onTap: () {
              showLogoutDialog();
            },
          ),
          const SizedBox(width: 10),
          GetBuilder<ThemeController>(builder: (themeController) {
            return MenuButton(
              icon: themeController.darkTheme
                  ? Icons.dark_mode
                  : Icons.light_mode,
              title: StringHelper.theme,
              onTap: () {
                themeController.toggleTheme();
              },
            );
          }),
          const SizedBox(width: 40)
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;

  const MenuButton(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Row(children: [
        Stack(clipBehavior: Clip.none, children: [
          Icon(
            icon,
            size: 20,
          ),
        ]),
        const SizedBox(width: 8),
        Text(title, style: TextStyles.regularTextStyle),
      ]),
    );
  }
}
