import 'package:flutter/material.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  CommonAppBar(
      {this.isBack = true,
      this.strTitle = '',
      this.onBack,
      this.actions,
      this.height = 50});

  final bool isBack;
  final String strTitle;
  final VoidCallback? onBack;
  final List<Widget>? actions;

  final double height;

  @override
  Widget build(final BuildContext context) {
    // TODO: implement build
    return AppBar(
      // toolbarHeight: 60,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leadingWidth: isBack ? 40 : 0,
      leading: isBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
                if (onBack != null) {
                  onBack;
                }
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.black,
              ))
          : const SizedBox(),
      title: Text(
        strTitle,
        style: rubikW700.copyWith(color: AppColors.white, fontSize: 20),
      ),
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
