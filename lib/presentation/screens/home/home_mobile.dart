import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysite/changes/img.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive_size.dart';
import 'package:sizer/sizer.dart';
import 'package:web/web.dart' as web;
import '../../../changes/links.dart';
import '../../widgets/color_chage_btn.dart';
import 'widgets/animation_text.dart';
import 'widgets/image _section.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, top: 5.h, right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              Text(hellotag, style: AppText.h3!.copyWith(fontSize: isFontSize(context, 16))),
              Image.asset(StaticImage.hi, height: 3.h),
            ],
          ),
          Text(
            yourname,
            style: TextStyle(fontSize: isFontSize(context, 28), fontWeight: FontWeight.w600),
          ),
          AnimatedTextKit(animatedTexts: mobileList, repeatForever: true, isRepeatingAnimation: true),

          StylishBackground(),
          ColorChangeButton(
            text: 'View Resume',
            onTap: () {
              web.window.open(resume, '_blank');
            },
          ),
        ],
      ),
    );
  }
}
