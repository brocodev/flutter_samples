class Sample {
  const Sample._({
    required this.title,
    required this.description,
    required this.designer,
    required this.pathImage,
    required this.route,
  });

  final String title;
  final String description;
  final String designer;
  final String pathImage;
  final String route;

  static const smartHome = Sample._(
    title: 'Smart Home',
    description: 'Flutter UI + Hero Animations',
    designer: 'giulio_cuscito',
    pathImage: 'assets/img/samples/smart_home.gif',
    route: 'smart_home',
  );
  static const samples = [
    smartHome,
  ];
}
