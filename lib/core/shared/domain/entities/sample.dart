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
    designer: 'Giuslucito',
    pathImage: 'assets/img/projects/findout.png',
    route: 'smart_home',
  );
  static const samples = [
    smartHome,
  ];
}
