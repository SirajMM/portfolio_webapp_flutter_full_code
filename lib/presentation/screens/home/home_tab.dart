import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysite/changes/img.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive_size.dart';
import 'package:mysite/presentation/utils/constants.dart';
import 'package:sizer/sizer.dart';
import '../../../changes/links.dart';
import '../../widgets/color_chage_btn.dart';
import 'widgets/animation_text.dart';
import 'widgets/image _section.dart';
import 'package:web/web.dart' as web;

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
      height: 60.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 10,
            child: const EntranceFader(
              offset: Offset(0, 0),
              delay: Duration(seconds: 1),
              duration: Duration(milliseconds: 800),
              child: StylishBackground(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(hellotag, style: AppText.h3!.copyWith(fontSize: isFontSize(context, 18))),
                    EntranceFader(
                      offset: const Offset(0, 0),
                      delay: const Duration(seconds: 2),
                      duration: const Duration(milliseconds: 800),
                      child: Image.asset(StaticImage.hi, height: 3.h),
                    ),
                  ],
                ),
                kHeight1,
                Text(
                  yourname,
                  style: TextStyle(fontSize: isFontSize(context, 38), fontWeight: FontWeight.w600),
                ),
                EntranceFader(
                  offset: const Offset(-10, 0),
                  delay: const Duration(seconds: 1),
                  duration: const Duration(milliseconds: 800),
                  child: AnimatedTextKit(animatedTexts: tabList, isRepeatingAnimation: true),
                ),
                kHeight1,
                Padding(
                  padding: EdgeInsets.only(right: 50.w),
                  child: Text(
                    miniDescription,
                    style: TextStyle(
                      fontSize: isFontSize(context, 16),
                      fontWeight: FontWeight.w100,
                      color: theme.textColor.withValues(alpha: 0.6),
                    ),
                  ),
                ),
                kHeight2,
                ColorChangeButton(
                  text: 'View Resume',
                  onTap: () {
                    web.window.open(resume, '_blank');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
