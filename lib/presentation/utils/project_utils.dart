class ProjectUtils {
  final String banners;
  final String icons;
  final String titles;
  final String description;
  final String links;
  ProjectUtils({
    required this.banners,
    required this.icons,
    required this.titles,
    required this.description,
    required this.links,
  });
}

List<ProjectUtils> projectUtils = [
  ProjectUtils(
    banners: 'assets/imgs/02.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Awesome Music player',
    description:
        'This is a just Fully functional music player App by using flutter, source code is also available, check below.',
    links: 'https://github.com/SirajMM/MusicPlayer',
  ),
  ProjectUtils(
    banners: 'assets/imgs/1.jpg',
    icons: 'assets/imgs/flutter.png',
    titles: 'Awesome E-commerce application',
    description:
        'This is a E-commerce application, source code is also available, check below.',
    links: 'https://github.com/SirajMM/Quibix-ecommerce-app',
  ),
  ProjectUtils(
    banners: 'assets/imgs/03.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Netflix clone App',
    description:
        'This is a just Netflix clone App using flutter, source code is also available, check below.',
    links: 'https://github.com/SirajMM/Netflix_clone',
  ),
  ProjectUtils(
    banners: 'assets/imgs/04.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Awesome Weather App',
    description:
        'This is a fully functional weather App, source code is also available, check below.',
    links: 'https://github.com/SirajMM/weather_app',
  ),
  ProjectUtils(
    banners: 'assets/imgs/05.png',
    icons: 'assets/imgs/flutter.png',
    titles: 'Awesome Student management App',
    description:
        'This is a fully Student management App, source code is also available, check below.',
    links: 'https://github.com/SirajMM/Student-Managment-App',
  ),
];
