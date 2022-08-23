class Module {
  final String image;
  final String name;
  final int videosCount;
  final bool isLocked;

  const Module({
    required this.image,
    required this.name,
    required this.videosCount,
    required this.isLocked,
  });

  Module copyWith({
    String? image,
    String? name,
    int? videosCount,
    bool? isLocked,
  }) {
    return Module(
      image: image ?? this.image,
      name: name ?? this.name,
      videosCount: videosCount ?? this.videosCount,
      isLocked: isLocked ?? this.isLocked,
    );
  }
}
