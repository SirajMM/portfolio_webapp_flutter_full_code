part of '../main_section.dart';

class NavbarDesktop extends StatefulWidget {
  const NavbarDesktop({super.key});

  @override
  State<NavbarDesktop> createState() => NavbarDesktopState();
}

class NavbarDesktopState extends State<NavbarDesktop> {
  final GlobalKey _iconKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var theme = Theme.of(context);

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
              decoration: BoxDecoration(color: (theme.navBarColor).withValues(alpha: 0.2)),
              child: Row(
                children: [
                  const NavBarLogo(),
                  Space.xm!,
                  ...NavBarUtils.names.asMap().entries.map(
                    (e) => NavBarActionButton(label: e.value, index: e.key),
                  ),
                  InkWell(
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
                      child: Image.network(
                        key: ValueKey(state.isDarkThemeOn),
                        state.isDarkThemeOn ? IconUrls.darkIcon : IconUrls.lightIcon,
                        height: 30,
                        width: 30,
                        color: state.isDarkThemeOn ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NavBarTablet extends StatelessWidget {
  const NavBarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.isTablet(context) ? 10.w : 10,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: theme.navBarColor.withValues(alpha: 0.2), // translucent background
          ),
          child: Row(
            children: [
              IconButton(
                highlightColor: Colors.white54,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
              Space.xm!,
              const NavBarLogo(),
            ],
          ),
        ),
      ),
    );
  }
}
