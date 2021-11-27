import 'package:demoproject/data_models/category.dart';
import 'package:demoproject/services/database_api.dart';
import 'package:mobx/mobx.dart';

import '../data_models/product.dart';
part 'store.g.dart';

DatabaseAPI _api = DatabaseAPI();

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  ObservableList<Category> categories = ObservableList<Category>.of([]);

  @observable
  ObservableList<Product> products = ObservableList<Product>.of([]);

  @observable
  String? searchKeyword;

  @computed
  List<Product> get filteredProducts {
    if (searchKeyword != null) {
      return ObservableList.of(
        products.where((Product product) {
          String productName = product.name.toLowerCase();
          bool inProductName = productName.contains(searchKeyword!);
          return inProductName;
        }).toList(),
      );
    } else {
      return products;
    }
  }

  @observable
  Category? currentlySelectedCategory;

  @action
  void initState() {
    fetchCategories().then(
      (_) {
        fetchProducts(categories.first.uid!);
        currentlySelectedCategory = categories.first;
      },
    );
  }

  @action
  Future fetchCategories() async {
    await _api.fetchDB();
    categories = ObservableList.of(_api.categories);
  }

  @action
  Future fetchProducts(String categoryUid) async {
    products = ObservableList.of(_api.products);
  }

  @action
  void changeCategory(Category category) {
    currentlySelectedCategory = category;
    fetchProducts(category.uid!);
  }

  @action
  void setSearchKeyword(String keyword) {
    searchKeyword = keyword.toLowerCase();
  }
}
