import 'package:flutter/material.dart';

import '../screens/contact/contact.dart';
import '../screens/home/home.dart';
import '../screens/portfolio/portfolio.dart';
import '../screens/services/services.dart';
import '../widgets/footer.dart';

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    // About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
