import 'package:flutter/material.dart';
import 'constant.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});
  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child:  Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: KlargeButtonTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 20),
        color: kBottomcontainercolor,
        margin: EdgeInsets.only(top: 4),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
