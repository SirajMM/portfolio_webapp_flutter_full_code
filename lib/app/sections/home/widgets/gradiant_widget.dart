import 'package:flutter/cupertino.dart';
import 'package:mysite/core/color/colors.dart';

class GradiantWidget extends StatelessWidget {
  const GradiantWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => pinkpurple.createShader(bounds),
      child: child,
    );
  }
}
