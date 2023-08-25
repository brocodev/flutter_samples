enum Sample {
  viceApp._(
    title: 'Vice App',
    description: 'Draggable Slider + 3D PageView + Slivers',
    designer: 'giulio_cuscito',
    pathImage: 'assets/img/samples/vice_app.gif',
    route: 'vice_app',
    heightCard: 250,
  ),
  smartHome._(
    title: 'Smart Home',
    description: 'Parallax Effect + Animations + Custom Hero ',
    designer: 'giulio_cuscito',
    pathImage: 'assets/img/samples/smart_home.gif',
    route: 'smart_home',
    heightCard: 250,
  );

  const Sample._({
    required this.title,
    required this.description,
    required this.designer,
    required this.pathImage,
    required this.route,
    this.heightCard = 220,
  });

  final String title;
  final String description;
  final String designer;
  final String pathImage;
  final String route;

  final double heightCard;
}
