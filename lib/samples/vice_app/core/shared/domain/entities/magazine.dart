class Magazine {
  const Magazine({
    required this.id,
    required this.assetImage,
    required this.description,
  });

  final String id;
  final String assetImage;
  final String description;
  static final List<Magazine> fakeMagazinesValues = List.generate(
    13,
    (index) => Magazine(
      id: '$index',
      assetImage: 'assets/img/vice/vice${index + 1}.png',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting '
          "industry. Lorem Ipsum has been the industry's standard dummy "
          'text ever since the 1500s, when an unknown printer took a galley '
          'of type and scrambled it to make a type specimen book. It has '
          'survived not only five centuries, but also the leap into '
          'electronic typesetting, remaining essentially unchanged. It was '
          'popularised in the 1960s with the release of word set sheets '
          'containing Lorem Ipsum passages, and more recently with desktop'
          ' publishing software like Aldus PageMaker including versions of '
          'Lorem Ipsum',
    ),
  );
}
