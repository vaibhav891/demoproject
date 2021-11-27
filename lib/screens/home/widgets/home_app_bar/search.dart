import 'package:demoproject/store/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppStore store = Provider.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(60),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for product",
                hintStyle: TextStyle(
                  color: Colors.white.withAlpha(120),
                ),
                border: InputBorder.none,
              ),
              onChanged: (String keyword) {
                store.setSearchKeyword(keyword);
              },
            ),
          ),
          Icon(
            Icons.search,
            color: Colors.white.withAlpha(120),
          )
        ],
      ),
    );
  }
}
