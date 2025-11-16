import 'package:mysite/core/res/responsive_size.dart';
import 'package:mysite/presentation/screens/home/widgets/image%20_section.dart';
import 'package:sizer/sizer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;

import 'package:mysite/changes/img.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/animations/entrance_fader.dart';
import 'package:mysite/core/configs/configs.dart';

import '../../../changes/links.dart';
import '../../widgets/color_chage_btn.dart';
import 'widgets/animation_text.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    Size size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: 70.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width / 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(hellotag,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w100,
                          )),
                      EntranceFader(
                        offset: const Offset(0, 0),
                        delay: const Duration(seconds: 2),
                        duration: const Duration(milliseconds: 800),
                        child: Image.asset(StaticImage.hi, height: 40),
                      ),
                    ],
                  ),
                  Text(yourname,
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                      )),
                  AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: desktopList,
                  ),
                  SizedBox(height: size.height / 100),
                  Text(
                    miniDescription,
                    style: TextStyle(
                      fontSize: isFontSize(context, 20),
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.fade,
                      color: theme.textColor.withValues(alpha: 0.6),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height / 30),
                  ColorChangeButton(
                    text: 'View Resume',
                    onTap: () {
                      web.window.open(resume, '_blank');
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: StylishBackground()),
          ],
        ),
      ),
    );
  }
}
