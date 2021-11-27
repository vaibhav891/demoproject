import 'package:demoproject/data_models/category.dart';
import 'package:demoproject/screens/home/products_screen.dart';
import 'package:demoproject/store/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: buildListCategory(),
    );
  }

  Widget buildListCategory() {
    final categories = Provider.of<AppStore>(context).categories;
    List<Widget> widgets = [];

    if (categories != null) {
      var list = categories.where((item) {
        var isNotParent = true;
        if (item.childCategory.isNotEmpty) {
          for (var category in categories) {
            if (category.childCategory.isNotEmpty) {
              isNotParent =
                  category.childCategory.contains(int.parse(item.uid!));
              if (isNotParent) break;
            }
          }
        }
        return !isNotParent;
      }).toList();
      for (var i = 0; i < list.length; i++) {
        final currentCategory = list[i];
        var childCategories = currentCategory.childCategory
            .map((e) => categories.firstWhere((element) {
                  return element.uid == e.toString();
                }))
            .toList();
        // categories.where((o) => o.parent == currentCategory.id).toList();
        widgets.add(Container(
          color: i.isOdd
              ? Theme.of(context).backgroundColor
              : Theme.of(context).primaryColorLight,

          /// Check to add only parent link category
          child: childCategories.isEmpty
              ? InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductsScreen(category: currentCategory)));
                    // ProductModel.showList(
                    //   context: context,
                    //   cateId: currentCategory.id,
                    //   cateName: currentCategory.name,
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 12,
                      left: 16,
                      top: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(currentCategory.name!.toUpperCase())),
                        const SizedBox(width: 24),
                        // currentCategory.totalProduct == null
                        //     ?
                        const Icon(Icons.chevron_right)
                        // : Padding(
                        //     padding:
                        //         const EdgeInsets.symmetric(vertical: 10),
                        //     child: Text(
                        //       '10 items',
                        //       style: TextStyle(
                        //         color: Theme.of(context).primaryColor,
                        //         fontSize: 12,
                        //       ),
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                )
              : ExpansionTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 0.0, top: 0),
                    child: Text(
                      currentCategory.name!.toUpperCase(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  children:
                      getChildren(categories, currentCategory, childCategories),
                ),
        ));
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: widgets,
      ),
    );
  }

  List<Widget> getChildren(List<Category> categories, Category currentCategory,
      List<Category> childCategories,
      {double paddingOffset = 0.0}) {
    List<Widget> list = [];

    list.add(
      ListTile(
        leading: Padding(
          child: const Text('See All'),
          padding: EdgeInsets.only(left: 20 + paddingOffset),
        ),
        trailing: Text(
          '>',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 20,
          ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductsScreen(category: currentCategory)));
          // ProductModel.showList(
          //   context: context,
          //   cateId: currentCategory.id,
          //   cateName: currentCategory.name,
          // );
        },
      ),
    );
    for (var i in childCategories) {
      var newChildren = i.childCategory
          .map((e) => categories.firstWhere((element) {
                return element.uid == e.toString();
              }))
          .toList();

      if (newChildren.isNotEmpty) {
        list.add(
          ExpansionTile(
            title: Padding(
              padding: EdgeInsets.only(left: 20.0 + paddingOffset),
              child: Text(
                i.name!.toUpperCase(),
                style: const TextStyle(fontSize: 14),
              ),
            ),
            children: getChildren(
              categories,
              i,
              newChildren,
              paddingOffset: paddingOffset + 10,
            ),
          ),
        );
      } else {
        list.add(
          ListTile(
            leading: Padding(
              child: Text(i.name ?? ''),
              padding: EdgeInsets.only(left: 20 + paddingOffset),
            ),
            trailing: Text(
              '>',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductsScreen(
                        category: i,
                      )));
              // ProductModel.showList(context: context, cateId: i.id, cateName: i.name);
            },
          ),
        );
      }
    }
    return list;
  }
}
