import 'package:flutter/material.dart';
import 'package:fluttertune/constants/app_constant.dart';

class MyShaderMask extends StatelessWidget {
  final Widget child;
  MyShaderMask({this.child});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: [AppConstant.PrimaryColor,AppConstant.SecondaryColor,AppConstant.AccentColor],
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
