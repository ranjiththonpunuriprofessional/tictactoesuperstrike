class PlayerGuideModal {
  final String description;
  final String imageUrl;
  final bool startHere;

  const PlayerGuideModal({
    required this.description,
    required this.imageUrl,
    this.startHere = false
  });
}
