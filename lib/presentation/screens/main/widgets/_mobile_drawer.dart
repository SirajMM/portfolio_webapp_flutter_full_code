part of '../main_section.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  final GlobalKey _iconKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Drawer(
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Material(
            color: theme.scaffoldBackgroundColor,
            child: Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: Column(
                children: [
                  const Center(child: NavBarLogo()),
                  const Divider(),
                  ListTile(
                    title: Text(state.isDarkThemeOn ? "Light Mode" : "Dark Mode"),
                    trailing: GestureDetector(
                      key: _iconKey,

                      onTap: () async {
                        final renderBox = _iconKey.currentContext?.findRenderObject() as RenderBox?;
                        if (renderBox == null) return;
                        final position = renderBox.localToGlobal(Offset.zero);
                        final buttonCenter =
                            position + Offset(renderBox.size.width / 2, renderBox.size.height / 2);

                        final overlay = CircularThemeRevealOverlay.of(context);
                        if (overlay != null) {
                          await overlay.startTransition(
                            center: buttonCenter,
                            reverse: !state.isDarkThemeOn,
                            onThemeChange: () {
                              context.read<ThemeCubit>().updateTheme(!state.isDarkThemeOn);
                            },
                          );
                        }
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 600),
                        transitionBuilder: (child, animation) {
                          final isLight = (child.key as ValueKey).value == false;
                          final rotationTween = isLight
                              ? Tween<double>(begin: 0, end: 1)
                              : Tween<double>(begin: 1, end: 0);
                          return RotationTransition(
                            turns: rotationTween.animate(animation),
                            child: FadeTransition(opacity: animation, child: child),
                          );
                        },
                        child: Icon(
                          key: ValueKey(state.isDarkThemeOn),
                          state.isDarkThemeOn ? Icons.dark_mode_outlined : Icons.light_mode,
                          color: theme.textColor,
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  ...NavBarUtils.names.asMap().entries.map(
                    (e) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        hoverColor: theme.primaryColor.withAlpha(70),
                        onPressed: () {
                          jumpTo(e.key);
                          Navigator.pop(context);
                        },
                        child: ListTile(
                          leading: Icon(NavBarUtils.icons[e.key], color: theme.primaryColor),
                          title: Text(e.value, style: AppText.l1),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
