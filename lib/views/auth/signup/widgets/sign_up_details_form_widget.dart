import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/auth/sign_up_details/sign_up_details_bloc.dart';
import 'package:flutter_project_structure/components/common_dropdown_widget.dart';
import 'package:flutter_project_structure/components/common_rich_text_widget.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/helper/extension/localization_extension.dart';
import 'package:flutter_project_structure/helper/validator.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';

class SignUpDetailsFormWidget extends StatelessWidget with Validator {
  const SignUpDetailsFormWidget({super.key});

  @override
  Widget build(final BuildContext buildContext) {
    return BlocBuilder<SignUpDetailsBloc, SignUpDetailsState>(
        builder: (final BuildContext context, final SignUpDetailsState state) {
      final SignUpDetailsBloc bloc = context.read<SignUpDetailsBloc>();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AppTextField(
            key: Key('signup_password_field'),
            type: TextFieldTypes.password,
            title: AppStrings.password,
            initialValue: state.password,
            strHeaderTitle: '${AppStrings.password.tr(buildContext)}',
            textInputAction: TextInputAction.next,
            nextFocusNode: bloc.cPasswordFocus,
            focusNode: bloc.passwordFocus,
            onChange: (final String value) {
              bloc.add(OnChangePassword(password: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('signup_confirm_password_field'),
            focusNode: bloc.cPasswordFocus,
            type: TextFieldTypes.password,
            title: AppStrings.confirmPassword,
            initialValue: state.confirmPassword,
            strHeaderTitle: '${AppStrings.confirmPassword.tr(buildContext)}',
            validator: (final String? value) {
              return validateConfirmPassword(value, state.password);
            },
            textInputAction: TextInputAction.next,
            onChange: (final String value) {
              bloc.add(OnChangeConfirmPassword(confirmPassword: value));
            },
          ),
          20.height,
          CommonDropdownWidget(
            placeholder: 'Please Select Question',
            listData: state.questionList,
            title: 'Security Question'.tr(context),
            selectedVal: state.securityQuestionId,
            height: 50,
            onValueChanged: (final dynamic value) {
              bloc.add(OnSelectQuestion(questionId: value));
            },
          ),
          20.height,
          AppTextField(
            key: Key('security_answer_field'),
            type: TextFieldTypes.text,
            title: 'Security Answer',
            initialValue: state.securityAnswer,
            strHeaderTitle: '${'Security Answer'.tr(buildContext)}',
            textInputAction: TextInputAction.done,
            focusNode: bloc.answerFocus,
            onChange: (final String value) {
              bloc.add(OnChangeAnswer(answer: value));
            },
          ),
          20.height,
          Row(
            children: <Widget>[
              Checkbox(
                  tristate: state.checkPrivacyPolicy,
                  value: state.checkPrivacyPolicy,
                  onChanged: (final bool? newValue) {
                    bloc.add(OnCheckPrivacyPolicy());
                  }),
              CommonRichTextWidget(
                strHeaderTitle: AppStrings.iReadAndAgreeTo,
                isRequired: false,
                strSubTitle: 'privacy policy',
                fontSize: 13,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Checkbox(
                  tristate: state.checkPrivacyPolicy,
                  value: state.checkTermsAndCondition,
                  onChanged: (final bool? newValue) {
                    bloc.add(OnCheckTermsAndCondition());
                  }),
              CommonRichTextWidget(
                strHeaderTitle: AppStrings.iReadAndAgreeTo,
                isRequired: false,
                strSubTitle: 'terms and conditions',
                fontSize: 13,
              ),
            ],
          ),
        ],
      );
    });
  }
}
