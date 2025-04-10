import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/components/common_app_bar.dart';
import 'package:flutter_project_structure/components/common_snack_bar.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:flutter_project_structure/views/auth/signup/widgets/signup_form_widget.dart';
import 'package:flutter_project_structure/views/auth/signup/widgets/signup_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<SignUpBloc>(
      create: (final BuildContext context) =>
          SignUpBloc(authRepo: context.read<AuthRepo>()),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (final BuildContext context, final SignUpState state) {
          if (state.status == CommonScreenState.success) {
            showSuccessSnackBar(AppMessages.registrationSuccess.message);
            Navigator.pop(context);
          }
        },
        builder: (final BuildContext context, final SignUpState state) {
          final SignUpBloc bloc = context.read<SignUpBloc>();
          return Stack(
            children: <Widget>[
              Scaffold(
                appBar: CommonAppBar(),
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: bloc.signUpFormKey,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SignUpHeaderWidget(),
                                  30.height,
                                  SignUpFormWidget(),
                                  // 40.height,
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.height,
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: AppButton(
                          title: AppStrings.next.tr(buildContext),
                          width: double.maxFinite,
                          isLoading: state.status == CommonScreenState.loading,
                          icon: null,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (bloc.signUpFormKey.currentState?.validate() ==
                                true) {
                              if (state.mobileNumber.isNotEmpty) {
                                if (state.birthDate != null &&
                                    state.countryId != null &&
                                    state.genderId != null) {
                                  Navigator.pushNamed(
                                      context, RouteName.signUpDetailScreen,
                                      arguments: SignupRequest(
                                          contactNo: state.mobileNumber,
                                          countryCodeISO2: state.countryCode,
                                          emailId: state.email,
                                          firstName: state.firstName,
                                          lastName: state.lastName,
                                          isdCode: state.countryISOCode,
                                          gender: state.genderList[
                                          state.genderId ?? 0]['value'],
                                          county: state.countryList[
                                          state.countryId ?? 0]['value'],
                                          address: state.address,
                                          dateOfBirth: state.birthDate
                                      ),);
                                } else {
                                  showErrorSnackBar(
                                      'Please Enter value'.tr(context));
                                }
                              } else {
                                showErrorSnackBar(
                                    'Please Enter Mobile Number'.tr(context));
                              }
                            }
                          },
                          type: AppButtonType.primary,
                        ),
                      ),
                      20.height,
                    ],
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
