import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/components/common_app_bar.dart';
import 'package:flutter_project_structure/components/common_snack_bar.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:flutter_project_structure/views/auth/signup/widgets/signup_form_widget.dart';
import 'package:flutter_project_structure/views/auth/signup/widgets/signup_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext buildContext) {
    return BlocProvider<SignUpBloc>(
      create: (final BuildContext context) =>
          SignUpBloc(authRepo: context.read<AuthRepo>()),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (final BuildContext context, final SignUpState state) {
          if (state.isSubmitting) {
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
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Form(
                            key: signUpFormKey,
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
                          title: AppStrings.submit.tr(buildContext),
                          width: double.maxFinite,
                          isLoading: state.isSubmitting,
                          icon: null,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            bloc.add(OnTapSubmit(formKey: signUpFormKey));
                          },
                          type: AppButtonType.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state.isSubmitting) Utils.loaderBrier(),
              if (state.isSubmitting) Utils.loaderWid(),
            ],
          );
        },
      ),
    );
  }
}
