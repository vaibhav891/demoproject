// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on AppStoreBase, Store {
  Computed<List<Product>>? _$filteredProductsComputed;

  @override
  List<Product> get filteredProducts => (_$filteredProductsComputed ??=
          Computed<List<Product>>(() => super.filteredProducts,
              name: 'AppStoreBase.filteredProducts'))
      .value;

  final _$categoriesAtom = Atom(name: 'AppStoreBase.categories');

  @override
  ObservableList<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$productsAtom = Atom(name: 'AppStoreBase.products');

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$searchKeywordAtom = Atom(name: 'AppStoreBase.searchKeyword');

  @override
  String? get searchKeyword {
    _$searchKeywordAtom.reportRead();
    return super.searchKeyword;
  }

  @override
  set searchKeyword(String? value) {
    _$searchKeywordAtom.reportWrite(value, super.searchKeyword, () {
      super.searchKeyword = value;
    });
  }

  final _$currentlySelectedCategoryAtom =
      Atom(name: 'AppStoreBase.currentlySelectedCategory');

  @override
  Category? get currentlySelectedCategory {
    _$currentlySelectedCategoryAtom.reportRead();
    return super.currentlySelectedCategory;
  }

  @override
  set currentlySelectedCategory(Category? value) {
    _$currentlySelectedCategoryAtom
        .reportWrite(value, super.currentlySelectedCategory, () {
      super.currentlySelectedCategory = value;
    });
  }

  final _$fetchCategoriesAsyncAction =
      AsyncAction('AppStoreBase.fetchCategories');

  @override
  Future<dynamic> fetchCategories() {
    return _$fetchCategoriesAsyncAction.run(() => super.fetchCategories());
  }

  final _$fetchProductsAsyncAction = AsyncAction('AppStoreBase.fetchProducts');

  @override
  Future<dynamic> fetchProducts(String categoryUid) {
    return _$fetchProductsAsyncAction
        .run(() => super.fetchProducts(categoryUid));
  }

  final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase');

  @override
  void initState() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.initState');
    try {
      return super.initState();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCategory(Category category) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.changeCategory');
    try {
      return super.changeCategory(category);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchKeyword(String keyword) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.setSearchKeyword');
    try {
      return super.setSearchKeyword(keyword);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
categories: ${categories},
products: ${products},
searchKeyword: ${searchKeyword},
currentlySelectedCategory: ${currentlySelectedCategory},
filteredProducts: ${filteredProducts}
    ''';
  }
}
