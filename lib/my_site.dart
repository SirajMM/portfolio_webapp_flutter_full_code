import 'dart:io';

import 'package:circular_theme_reveal/circular_theme_reveal.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mouse_follower/mouse_follower.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/configs/connection/bloc/connected_bloc.dart';
import 'package:mysite/core/configs/connection/network_check.dart';

import 'package:mysite/core/theme/cubit/theme_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/res/responsive.dart';

class MySite extends StatelessWidget {
  const MySite({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<ConnectedBloc>(create: (context) => ConnectedBloc()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        buildWhen: (previous, current) => current.isDarkThemeOn != previous.isDarkThemeOn,
        builder: (context, state) {
          return Sizer(
            builder: (context, _, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Siraj',
                theme: AppTheme.themeData(state.isDarkThemeOn, context),
                themeAnimationDuration: Duration.zero,
                builder: (context, child) =>
                    CircularThemeRevealOverlay(child: child ?? SizedBox.shrink()),
                initialRoute: "/",
                routes: {
                  "/": (context) =>
                      defaultTargetPlatform == TargetPlatform.iOS ||
                          defaultTargetPlatform == TargetPlatform.android
                      ? const NChecking()
                      : MouseFollower(
                          mouseStylesStack: [
                            MouseStyle(
                              size: const Size(7, 7),
                              latency: const Duration(milliseconds: 25),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            MouseStyle(
                              size: const Size(26, 26),
                              latency: const Duration(milliseconds: 100),
                              visibleOnHover: false,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                          child: const NChecking(),
                        ),
                },
              );
            },
          );
        },
      ),
    );
  }
}
