import 'package:flutter/cupertino.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class CommonRichTextWidget extends StatelessWidget {
  final String strHeaderTitle;
  final String strSubTitle;
  final bool isRequired;
  final double fontSize;
  const CommonRichTextWidget({super.key,this.strHeaderTitle = '',this.isRequired = true,
  this.strSubTitle = '', this.fontSize = 16
  });

  @override
  Widget build(final BuildContext context) {
    return RichText(
      text: TextSpan(
        text: strHeaderTitle.tr(context),
        style: interW500.copyWith(fontSize : fontSize),
        children: isRequired ? <TextSpan>[
          TextSpan(
            text: '*',
            style: interW500.copyWith(
                fontSize: 16, color: AppColors.colorError500),
          ),
        ] : <InlineSpan>[
          TextSpan(
            text: strSubTitle.tr(context),
            style: interW500.copyWith(
                fontSize: fontSize, color: AppColors.colorPrimary500),
          ),
        ],
      ),
    );
  }
}
