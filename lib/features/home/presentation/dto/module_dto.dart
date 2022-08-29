class ModuleDto {
  final String image;
  final String name;
  final int videosCount;
  final bool isLocked;

  const ModuleDto({
    required this.image,
    required this.name,
    required this.videosCount,
    required this.isLocked,
  });

  ModuleDto copyWith({
    String? image,
    String? name,
    int? videosCount,
    bool? isLocked,
  }) {
    return ModuleDto(
      image: image ?? this.image,
      name: name ?? this.name,
      videosCount: videosCount ?? this.videosCount,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}
