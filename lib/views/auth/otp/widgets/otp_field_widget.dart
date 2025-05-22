import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFieldWidget extends StatelessWidget {
  final Function(String)? onChanged;

  const OtpFieldWidget({super.key, this.onChanged});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: PinCodeTextField(
        key: Key('otp_field_key'),
        autoFocus: true,
        appContext: context,
        length: 6,
        showCursor: true,
        cursorColor: AppColors.colorPrimary500,
        textStyle: dMSansW700.copyWith(fontSize: 20),
        onChanged: onChanged,
        animationType: AnimationType.scale,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderWidth: 1.5,
          activeBorderWidth: 1.5,
          inactiveBorderWidth: 1.5,
          selectedBorderWidth: 1.5,
          disabledBorderWidth: 1.5,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: 55,
          fieldWidth: (MediaQuery.of(context).size.width - 130) / 6,
          activeColor: AppColors.colorA478D1,
          selectedColor: AppColors.colorA478D1,
          inactiveColor: AppColors.baseColorWhite45,
        ),
      ),
    );
  }
}
