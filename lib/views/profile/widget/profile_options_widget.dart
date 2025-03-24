import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/bloc/user/profile_bloc.dart';
import 'package:flutter_project_structure/views/profile/widget/profile_cell_widget.dart';

class ProfileOptionsWidget extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
        builder: (final BuildContext context, final ProfileState state) {
      final bloc = context.read<ProfileBloc>();
      return ListView.separated(
        shrinkWrap: true,
        itemCount: bloc.arrProfileOptions.length,
        itemBuilder: (final BuildContext context, final int index) {
          return ProfileCell(item: bloc.arrProfileOptions[index]);
        },
        separatorBuilder: (final BuildContext context, final int index) {
          return 16.height;
        },
      );
    });
  }
}
