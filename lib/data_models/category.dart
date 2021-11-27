class Category {
  final String? _name, _uid;
  final List _childCategory;
  String? get name => _name;
  String? get uid => _uid;
  List get childCategory => _childCategory;

  Category._({required List childCategory, String? name, String? uid})
      : _name = name,
        _childCategory = childCategory,
        _uid = uid;
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category._(
        name: json['name'],
        uid: json['id'].toString(),
        childCategory: json['child_categories']);
  }
}
