import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mysite/changes/strings.dart';
import 'package:mysite/core/configs/configs.dart';

List<TyperAnimatedText> desktopList = [
  TyperAnimatedText(animationtxt1,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 32)),
];

List<TyperAnimatedText> tabList = [
  TyperAnimatedText(animationtxt1,
      speed: const Duration(milliseconds: 50),
      textStyle: AppText.h2!.copyWith(fontSize: 20)),
];
List<TyperAnimatedText> mobileList = [
  TyperAnimatedText(animationtxt1,
      speed: const Duration(milliseconds: 50),
      textStyle:
          AppText.h2!.copyWith(fontSize: 12, overflow: TextOverflow.ellipsis)),
];
