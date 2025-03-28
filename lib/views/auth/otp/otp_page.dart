import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/auth/otp/otp_bloc.dart';
import 'package:flutter_project_structure/components/common_app_bar.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';
import 'package:flutter_project_structure/theme/font_styles.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/app_strings.dart';
import 'package:flutter_project_structure/views/auth/otp/widgets/otp_field_widget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final Object? arguments = ModalRoute.of(context)?.settings.arguments;

    final Map<String, dynamic> args =
        arguments is Map<String, dynamic> ? arguments : {};

    return BlocProvider<OtpBloc>(
      create: (final BuildContext context) => OtpBloc()..add(StartTimerEvent()),
      child: BlocConsumer<OtpBloc, OtpState>(
        listener: (final BuildContext context, final OtpState state) {},
        builder: (final BuildContext context, final OtpState state) {
          final OtpBloc bloc = context.read<OtpBloc>();
          return Stack(
            children: <Widget>[
              Scaffold(
                appBar: CommonAppBar(),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: bloc.otpFormKey,
                      child: ValueListenableBuilder<String>(
                          valueListenable: bloc.count,
                          builder: (final BuildContext context,
                              final String value, final Widget? child) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'OTP Verification'.tr(context),
                                  style: interW500.copyWith(fontSize: 20),
                                ),
                                15.height,
                                Text(
                                  'We have send an OTP on : ${args['emailOrPhone'] ?? ''}'
                                      .tr(context),
                                  style: dMSansW400.copyWith(fontSize: 14),
                                ),
                                10.height,
                                Text(
                                  value.toString(),
                                  style: dMSansW400.copyWith(
                                      fontSize: 12,
                                      color: AppColors.colorPrimary500),
                                ),
                                10.height,
                                GestureDetector(
                                  onTap: () {
                                    bloc.add(StartTimerEvent());
                                  },
                                  child: Text(
                                    'Resend OTP?'.tr(context),
                                    style: dMSansW400.copyWith(
                                        fontSize: 12,
                                        color: value == '0'
                                            ? AppColors.colorPrimary500
                                            : AppColors.colorError500),
                                  ),
                                ),
                                30.height,
                                OtpFieldWidget(
                                  onChanged: (final String otp) {
                                    bloc.add(OnChangeOtp(otp: otp));
                                  },
                                ),
                                20.height,
                              ],
                            );
                          }),
                    ),
                  ),
                ),
                bottomSheet: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AppButton(
                    title: AppStrings.next.tr(context),
                    width: double.maxFinite,
                    isLoading: state.status == CommonScreenState.loading,
                    onPressed: () async {
                      if (state.status == CommonScreenState.success) {
                        /* Navigator.pushNamedAndRemoveUntil(context, RouteName.tabNavigationView,
                              (final Route<dynamic> route) => false,
                        );*/

                        SharedPreferenceHelper().saveIsLoggedIn(true);
                        Navigator.pushNamed(
                          context,
                          RouteName.tabNavigationView,
                        );
                      }
                    },
                    type: AppButtonType.primary,
                    icon: null,
                  ),
                ),
              ),
              if (state.status == CommonScreenState.loading)
                Utils.loaderBrier(),
              if (state.status == CommonScreenState.loading) Utils.loaderWid(),
            ],
          );
        },
      ),
    );
  }
}
