import 'package:flutter/material.dart';
import 'package:mysite/core/configs/configs.dart';
import 'package:mysite/core/configs/connection/bloc/connected_bloc.dart';
import 'package:mysite/core/configs/connection/network_check.dart';

import 'package:mysite/core/theme/cubit/theme_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

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
          buildWhen: (previous, current) =>
              current.isDarkThemeOn != previous.isDarkThemeOn,
          builder: (context, state) {
            return Sizer(builder: (context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Siraj',
                theme: AppTheme.themeData(state.isDarkThemeOn, context),
                initialRoute: "/",
                routes: {"/": (context) => const NChecking()},
              );
            });
          }),
    );
  }
}
