import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/auth/otp/otp_bloc.dart';
import 'package:flutter_project_structure/components/common_button_widget.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/routes/routes_name.dart';
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
      create: (final BuildContext context) => OtpBloc()..add(StartOtpTimer()),
      child: BlocConsumer<OtpBloc, OtpState>(
        listener: (final BuildContext context, final OtpState state) {},
        builder: (final BuildContext context, final OtpState state) {
          final OtpBloc bloc = context.read<OtpBloc>();
          return Stack(
            children: <Widget>[
              Scaffold(
                body: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 130, left: 16, right: 16),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: AppColors.colorPrimary500,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            AppColors.colorA478D1,
                            AppColors.color4478D1
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Verify Your One Time Password'.tr(context),
                            style: dMSansW700.copyWith(
                                color: AppColors.white, fontSize: 25),
                          ),
                          12.height,
                          Text(
                            'We have send an OTP on : ${args['emailOrPhone'] ?? ''}'
                                .tr(context),
                            style: dMSansW400.copyWith(color: AppColors.white),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        _otpView(context, bloc, state),
                        Spacer(),
                        _VerifyButton(context, state),
                      ],
                    ),
                  ],
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

  Widget _otpView(
      final BuildContext context, final OtpBloc bloc, final OtpState state) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: EdgeInsets.only(left: 20, right: 20, top: (size.height * 0.3)),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withValues(alpha: 0.10),
                blurRadius: 10,
                offset: Offset(0, 0),
                spreadRadius: 6)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          25.height,
          OtpFieldWidget(
            onChanged: (final String otp) {
              bloc.add(OnChangeOtp(otp: otp));
            },
          ),
          state.canResend
              ? TextButton(
                  onPressed: () => context.read<OtpBloc>().add(StartOtpTimer()),
                  child: Text(
                    'Resend OTP',
                    style: dMSansW600.copyWith(
                        fontSize: 12, color: AppColors.colorPrimary500),
                  ),
                )
              : Text(
                  'Resend in ${bloc.formatTime(state.secondsLeft)}',
                  style: dMSansW600.copyWith(
                      fontSize: 12, color: AppColors.colorError500),
                ),
        ],
      ),
    );
  }

  Widget _VerifyButton(final BuildContext context, final OtpState state) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: AppButton(
          key: Key('otp_next_button'),
          title: AppStrings.next.tr(context),
          width: double.maxFinite,
          isLoading: state.status == CommonScreenState.loading,
          onPressed: () async {
            if (state.status == CommonScreenState.success) {
              SharedPreferenceHelper().saveIsLoggedIn(true);
              Navigator.pushNamedAndRemoveUntil(
                context,
                RouteName.tabNavigationView,
                (final Route<dynamic> route) => false,
              );
              /* Navigator.pushNamed(
                                context,
                                RouteName.tabNavigationView,
                              );*/
            }
          },
          type: AppButtonType.primary,
          icon: null,
        ),
      ),
    );
  }
}
