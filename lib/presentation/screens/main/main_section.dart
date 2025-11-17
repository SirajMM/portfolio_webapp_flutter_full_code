import 'dart:ui';
import 'package:circular_theme_reveal/circular_theme_reveal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mysite/core/apis/links.dart';
import 'package:mysite/core/configs/app.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/res/responsive.dart';
import 'package:mysite/core/theme/cubit/theme_cubit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/material.dart';
import 'package:mysite/core/util/constants.dart';
import 'package:sizer/sizer.dart';

import '../../utils/navbar_utils.dart';
import '../../utils/utils.dart';
import '../../widgets/arrow_on_top.dart';
import '../../widgets/navbar_actions_button.dart';
import '../../widgets/navbar_logo.dart';
part 'widgets/_navbar_desktop.dart';
part 'widgets/_mobile_drawer.dart';
part 'widgets/_body.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Responsive(desktop: NavbarDesktop(), mobile: NavBarTablet(), tablet: NavBarTablet()),
      ),
      drawer: !Responsive.isDesktop(context) ? const MobileDrawer() : null,
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Stack(
            children: [
              if (!state.isDarkThemeOn)
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/imgs/5424482.JPG',
                    opacity: const AlwaysStoppedAnimation<double>(0.2),
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              if (!state.isDarkThemeOn)
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/imgs/BG01.png',
                    opacity: const AlwaysStoppedAnimation<double>(0.1),
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),

              /// body items
              Body(),
              const ArrowOnTop(),
            ],
          );
        },
      ),
    );
  }
}
