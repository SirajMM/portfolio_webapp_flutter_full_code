import 'package:flutter/animation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';

// URL Launcher
void openURL(String url) => launchUrl(Uri.parse(url));
final ItemScrollController itemScrollController = ItemScrollController();
final scrollDuration = const Duration(seconds: 1);

void jumpTo(int index) => itemScrollController.scrollTo(
    index: index,
    duration: scrollDuration,
    curve: Curves.easeInOutCubic,
    alignment: 0);
