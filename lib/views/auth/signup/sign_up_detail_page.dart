import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/auth/sign_up_details/sign_up_details_bloc.dart';
import 'package:flutter_project_structure/components/common_app_bar.dart';
import 'package:flutter_project_structure/components/common_snack_bar.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/views/auth/signup/widgets/sign_up_details_form_widget.dart';
import 'package:flutter_project_structure/views/auth/signup/widgets/signup_header_widget.dart';

class SignUpDetailScreen extends StatelessWidget {
  const SignUpDetailScreen({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    final SignupRequest  arguments = ModalRoute.of(buildContext)?.settings.arguments as SignupRequest;
    return BlocProvider<SignUpDetailsBloc>(
      create: (final BuildContext context) =>
          SignUpDetailsBloc(authRepo: context.read<AuthRepo>())..add(InitialEvent(signupRequest: arguments)),
      child: BlocListener<SignUpDetailsBloc, SignUpDetailsState>(
  listener: (final BuildContext context, final SignUpDetailsState state) {
    if (state.status == CommonScreenState.success) {
      showSuccessSnackBar(AppMessages.registrationSuccess.message);
      Navigator.pushNamed(context, RouteName.otpScreen);
    }
  },
  child: BlocBuilder<SignUpDetailsBloc, SignUpDetailsState>(
        builder: (final BuildContext context, final SignUpDetailsState state) {
          final SignUpDetailsBloc bloc = context.read<SignUpDetailsBloc>();
          return Stack(
            children: <Widget>[
              Scaffold(
                appBar: CommonAppBar(),
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Form(
                              key: bloc.signUpFormKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SignUpHeaderWidget(),
                                  30.height,
                                  SignUpDetailsFormWidget(),
                                ],
                              )),
                        )),
                        20.height,
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: AppButton(
                            title: AppStrings.submit.tr(buildContext),
                            width: double.maxFinite,
                            isLoading:
                                state.status == CommonScreenState.loading,
                            icon: null,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (bloc.signUpFormKey.currentState?.validate() ==
                                  true) {
                                if (state.securityQuestionId != null) {
                                  Navigator.pushNamed(
                                      context, RouteName.otpScreen);
                                   //   bloc.add(OnTapSubmit());
                                } else {
                                  showErrorSnackBar(
                                      'Please Select Question'.tr(context));
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
              ),
              if (state.status == CommonScreenState.loading)
                Utils.loaderBrier(),
              if (state.status == CommonScreenState.loading) Utils.loaderWid(),
            ],
          );
        },
      ),
),
    );
  }
}
