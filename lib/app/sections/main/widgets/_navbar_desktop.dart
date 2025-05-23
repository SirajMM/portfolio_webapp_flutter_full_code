part of '../main_section.dart';

class NavbarDesktop extends StatefulWidget {
  const NavbarDesktop({super.key});

  @override
  State<NavbarDesktop> createState() => NavbarDesktopState();
}

class NavbarDesktopState extends State<NavbarDesktop> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // theme
    var theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(builder: (context, state) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: size.width / 8, vertical: 10),
        color: theme.navBarColor,
        child: Row(
          children: [
            const NavBarLogo(),
            Space.xm!,
            ...NavBarUtils.names.asMap().entries.map(
                  (e) => NavBarActionButton(
                    label: e.value,
                    index: e.key,
                  ),
                ),
            // Space.x!,
            InkWell(
                onTap: () {
                  context.read<ThemeCubit>().updateTheme(!state.isDarkThemeOn);
                },
                child: Image.network(
                  state.isDarkThemeOn ? IconUrls.darkIcon : IconUrls.lightIcon,
                  height: 30,
                  width: 30,
                  color: state.isDarkThemeOn ? Colors.black : Colors.white,
                )),
            // Space.x!,
          ],
        ),
      );
    });
  }
}

class NavBarTablet extends StatelessWidget {
  const NavBarTablet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      color: theme.navBarColor,
      padding: EdgeInsets.symmetric(
          horizontal: Responsive.isTablet(context) ? 10.w : 10, vertical: 10),
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
          // Space.x1!,
        ],
      ),
    );
  }
}
