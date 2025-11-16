part of '../main_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      padding: EdgeInsets.zero,
      itemCount: BodyUtils.views.length,
      itemBuilder: (context, index) => BodyUtils.views[index],
      itemScrollController: itemScrollController,
    );
  }
}
