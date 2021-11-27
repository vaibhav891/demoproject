class Product {
  final String _name, _description, _uid;
  final int _category;
  final List<String> _photos;
  final int _backgroundColor;
  final num _minprice;
  final num _maxprice;
  final List<String> _colors;
  final List<int> _sizes;
  final bool _isHot;

  String get name => _name;
  String get uid => _uid;
  int get category => _category;
  List<String> get photos => _photos;
  List<String> get colors => _colors;
  List<int> get sizes => _sizes;
  String get defaultPhoto => _photos.first;
  num get minPrice => _minprice;
  num get maxPrice => _maxprice;
  int get backgroundColor => _backgroundColor;
  String get description => _description;
  bool get isHot => _isHot;

  Product._({
    required String uid,
    required String name,
    required String description,
    required int category,
    required num minprice,
    required num maxprice,
    required List<String> photos,
    required int backgroundColor,
    required bool isHot,
    required List<String> colors,
    required List<int> sizes,
  })  : _uid = uid,
        _name = name,
        _description = description,
        _category = category,
        _minprice = minprice,
        _maxprice = maxprice,
        _photos = photos,
        _colors = colors,
        _sizes = sizes,
        _backgroundColor = backgroundColor,
        _isHot = isHot;

  // Product({
  //   required String uid,
  //   required String name,
  //   required String description,
  //   required String category,
  //   required num price,
  //   required String photoUrl,
  //   required int backgroundColor,
  //   required bool isHot,
  // })  : _uid = uid,
  //       _name = name,
  //       _description = description,
  //       _category = category,
  //       _minprice = price,
  //       _photos = [photoUrl],
  //       _backgroundColor = backgroundColor,
  //       _isHot = isHot;

  factory Product.fromJson(Map<String, dynamic> json, int categoryId) {
    List<String> photos = json['photos'] != null
        ? List.castFrom<dynamic, String>(json['photos'])
        : ['https://picsum.photos/200'];
    int backgroundColor = json['backgroundColor'] != null
        ? int.tryParse(json['backgroundColor']) ?? 0
        : 0;
    List<String> colors = [];
    List<int> sizes = [];
    int minPrice = 10000;
    int maxPrice = 0;
    for (var variant in json['variants']) {
      if (variant['price'] < minPrice) {
        minPrice = variant['price'];
      }
      if (variant['price'] > maxPrice) {
        maxPrice = variant['price'];
      }
      if (!colors.contains(variant['color'])) {
        colors.add(variant['color']);
      }
      if (variant['size'] != null && !sizes.contains(variant['size'])) {
        sizes.add(variant['size']);
      }
    }
    return Product._(
      uid: json['id'].toString(),
      name: json['name'],
      description: json['description'] ?? '',
      category: categoryId,
      backgroundColor: backgroundColor,
      photos: photos,
      isHot: false,
      minprice: minPrice,
      maxprice: maxPrice,
      colors: colors,
      sizes: sizes,
    );
  }
}
