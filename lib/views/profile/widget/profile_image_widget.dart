import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/components/user_default_avatar_widget.dart';
import 'package:flutter_project_structure/gen/assets.gen.dart';
import 'package:flutter_project_structure/helper/extension/string_ext.dart';
import 'package:flutter_project_structure/theme/app_colors.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget(
      {super.key,
      required this.imageUrl,
      required this.canEdit,
      this.onTapCamera});

  final String imageUrl;
  final bool canEdit;
  final VoidCallback? onTapCamera;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: canEdit ? onTapCamera : () {},
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          imageUrl.isNotNullAndEmpty()
              ? imageUrl.isNetworkUrl()
                  ? CachedNetworkImage(
                      imageUrl: imageUrl,
                      imageBuilder: (final BuildContext context,
                          final ImageProvider<Object> imageProvider) {
                        return Container(
                          height: 92,
                          width: 92,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: AppColors.color808080, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      errorWidget: (final BuildContext context,
                          final String url, final Object error) {
                        return _placeholder();
                      },
                      placeholder:
                          (final BuildContext context, final String url) {
                        return _placeholder();
                      },
                    )
                  : Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border:
                            Border.all(color: AppColors.color808080, width: 2),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.file(
                          fit: BoxFit.cover,
                          File(imageUrl),
                        ),
                      ),
                    )
              : _placeholder(),
          Positioned(
            // right: 10,
            child: Visibility(
              visible: canEdit,
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.04),
                      blurRadius: 12,
                      spreadRadius: 0,
                      offset: const Offset(0, 6),
                    )
                  ],
                ),
                child: Assets.svg.icEdit.svg(height: 30, width: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeholder() {
    return UserDefaultAvatar(
      size: 100,
      borderRadius: 50,
      border: Border.all(color: AppColors.color808080, width: 2),
    );
  }
}
