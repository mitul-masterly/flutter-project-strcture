import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class AppbarWithBackIconAndTitle extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarWithBackIconAndTitle(
      {super.key,
      this.title = '',
      this.leadingAction,
      this.leadingIcon,
      this.titleColor = Colors.black,
      this.height = 50});

  final String title;
  final Widget? leadingIcon;
  final VoidCallback? leadingAction;
  final Color titleColor;
  final double height;

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          7.width,
          IconButton(
            onPressed: leadingAction ??
                () {
                  Navigator.pop(context);
                },
            icon: leadingIcon ??
                Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.black,
                ),
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style:
                    dMSansW700.copyWith(color: AppColors.black, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 50,
          ),
          7.width,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class AppbarWithTitle extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWithTitle(
      {super.key, this.title = '', this.titleStyle, this.height = 50});

  final String title;
  final TextStyle? titleStyle;
  final double height;

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(),
          Text(
            title,
            style: titleStyle ??
                dMSansW700.copyWith(color: AppColors.black, fontSize: 20),
          ),
          Spacer(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class AppbarWithBackIconTitleAndSuffixWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppbarWithBackIconTitleAndSuffixWidget(
      {super.key,
      required this.title,
      required this.suffixWidget,
      this.backIcon,
      this.showBackIcon,
      this.height = 50,
      this.leadingAction,
      this.leadingIcon,
      this.titleColor = Colors.black,
      this.titleStyle});

  final String title;
  final Widget suffixWidget;
  final String? backIcon;
  final bool? showBackIcon;
  final Widget? leadingIcon;
  final VoidCallback? leadingAction;
  final Color titleColor;
  final double height;
  final TextStyle? titleStyle;

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          7.0.width,
          Visibility(
            visible: (showBackIcon ?? true),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: leadingIcon ??
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.black,
                  ),
            ),
            replacement: SizedBox(
              height: 50,
              width: 50,
            ),
          ),
          10.width,
          Expanded(
            child: Center(
              child: Text(
                title,
                style: titleStyle ??
                    dMSansW700.copyWith(color: AppColors.black, fontSize: 20),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          10.width,
          suffixWidget,
          7.width,
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
