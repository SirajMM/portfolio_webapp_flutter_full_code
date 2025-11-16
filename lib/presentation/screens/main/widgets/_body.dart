part of '../main_section.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(_) {
    return ScrollablePositionedList.builder(
      padding: .only(top: 120),
      itemCount: BodyUtils.views.length,
      itemBuilder: (_, index) => BodyUtils.views[index],
      itemScrollController: itemScrollController,
    );
  }
}
