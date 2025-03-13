import 'package:flutter/material.dart';

class BottomSheetDragLine extends StatelessWidget {
  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 5,
      width: 60,
      margin: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(2.5),
      ),
    );
  }
}
