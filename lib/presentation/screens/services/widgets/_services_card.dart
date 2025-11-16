part of '../services.dart';

class ServiceCard extends StatefulWidget {
  final ServicesUtils service;

  const ServiceCard({super.key, required this.service});

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final service = widget.service;
    final isDesktop = Responsive.isDesktop(context);
    final isTablet = Responsive.isTablet(context);
    final isMobile = Responsive.isMobile(context);

    final baseTextColor = isHover ? whiteColor : theme.textColor;
    final descTextColor = isHover ? whiteColor.withValues(alpha: 0.8) : theme.textColor;

    return InkWell(
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: (hovering) {
        if (hovering != isHover) {
          setState(() => isHover = hovering);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: isTablet ? 400 : 300,
        height: (isTablet || isMobile) ? 200 : 300,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          gradient: isHover ? pinkpurple : theme.serviceCard,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [isHover ? primaryColorShadow : blackColorShadow],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(service.icon, height: 60),
            Space.y(3.w)!,
            Text(
              service.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: baseTextColor),
            ),
            Space.y(1.w)!,
            Text(
              service.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: descTextColor,
                fontWeight: FontWeight.w200,
                fontSize: 13,
              ),
            ),
            Space.y(2.w)!,
            if (isDesktop)
              _buildToolList(service.tool, baseTextColor)
            else if (isTablet || isMobile)
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: service.tool.length,
                  itemBuilder: (context, index) => _buildToolRow(
                    service.tool[index],
                    baseTextColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolList(List<String> tools, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tools.map((e) => _buildToolRow(e, textColor)).toList(),
    );
  }

  Widget _buildToolRow(String tool, Color textColor) {
    return Row(
      children: [
        const Text('🛠   '),
        Text(tool, style: TextStyle(color: textColor)),
      ],
    );
  }
}
