import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mysite/app/sections/main/main_section.dart';
import 'bloc/connected_bloc.dart';

class NChecking extends StatefulWidget {
  const NChecking({super.key});

  @override
  State<NChecking> createState() => _NCheckingState();
}

class _NCheckingState extends State<NChecking> {
  @override
  void initState() {
    super.initState();
    context.read<ConnectedBloc>().add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectedBloc, ConnectedState>(
      builder: (context, state) {
        if (state is ConnectedSucessState) {
          return const MainPage();
        } else {
          return const NoConnectionErorr();
        }
      },
    );
  }
}

class NoConnectionErorr extends StatelessWidget {
  const NoConnectionErorr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Connection failed!"),
          ],
        ),
      ),
    );
  }
}
