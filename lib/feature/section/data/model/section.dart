class Section {
  final int id;
  final String code;
  final String name;

  final int isActive;

  const Section({
    required this.id,
    required this.code,
    required this.name,
    this.isActive = 0
  });

  @override
  String toString() {
    return 'Section{id: $id, code: $code, name: $name, isActive: $isActive}';
  }
}
