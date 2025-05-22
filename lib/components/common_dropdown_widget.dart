import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/components/common_rich_text_widget.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';

class CommonDropdownWidget extends StatelessWidget {
  final List<dynamic> listData;
  final String title;
  final String? placeholder;
  final dynamic selectedVal;
  final double? height;
  final Function(dynamic) onValueChanged;

  const CommonDropdownWidget({
    super.key,
    required this.listData,
    required this.title,
    this.placeholder = '',
    required this.selectedVal,
    required this.height,
    required this.onValueChanged,
  });

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CommonRichTextWidget(strHeaderTitle: title),
        10.height,
        Container(
          decoration: Utils.borderBox(
              borderColor: AppColors.baseColorWhite85, radius: 8.0),
          height: height,
          child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButtonFormField<Object>(
                // dropdownColor: AppColors.white,
                borderRadius: BorderRadius.circular(10),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide.none, // Remove border to avoid conflict
                  ),
                  contentPadding: EdgeInsets.zero,
                ),
                hint: (placeholder != null && placeholder!.isNotEmpty)
                    ? Text(
                        placeholder!,
                        style: dMSansW400.copyWith(
                            color: AppColors.baseColorWhite45, fontSize: 13),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    : SizedBox(),
                value: selectedVal,
                padding: const EdgeInsets.all(0),
                onChanged: onValueChanged,
                onSaved: (final Object? value) {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.colorNeutral700,
                  size: 20,
                ),
                items: listData.map((final dynamic valueItem) {
                  return DropdownMenuItem<Object>(
                      value: valueItem!['id'],
                      child: Text(
                        valueItem!['value'].toString(),
                        style: dMSansW400,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ));
                }).toList(),
              )),
        ),
      ],
    );
  }
}
