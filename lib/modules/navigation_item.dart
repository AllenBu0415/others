class NavigationItem {
  final String path;
  final String title;
  final String description;
  final String image;

  const NavigationItem({
    required this.path,
    required this.title,
    required this.description,
    required this.image,
  });

  // 从 Map 转换为对象
  factory NavigationItem.fromMap(Map<String, dynamic> map) {
    return NavigationItem(
      path: map['path'],
      title: map['title'],
      description: map['description'],
      image: map['image'],
    );
  }

  // 从对象转为 Map（用于保存或传输）
  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'title': title,
      'description': description,
      'image': image,
    };
  }
}