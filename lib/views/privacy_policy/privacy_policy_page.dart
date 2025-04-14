import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/privacy_policy/privacy_policy_bloc.dart';
import 'package:flutter_project_structure/components/common_app_bar.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    return BlocProvider<PrivacyPolicyBloc>(
      create: (final BuildContext context) => PrivacyPolicyBloc()
        ..add(PrivacyPolicyEvent.initial(url: arguments?['policy'].url ?? '')),
      child: BlocBuilder<PrivacyPolicyBloc, PrivacyPolicyState>(
        builder: (final BuildContext context, final PrivacyPolicyState state) {
          final PrivacyPolicyBloc bloc = context.read<PrivacyPolicyBloc>();
          return Stack(
            children: <Widget>[
              SafeArea(
                child: Scaffold(
                    appBar: CommonAppBar(
                      strTitle: arguments?['policy'].title ?? '',
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: arguments?['policy'].url != null &&
                              arguments?['policy'].url != ''
                          ? WebViewWidget(controller: state.controller)
                          : SizedBox(),
                    )),
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
