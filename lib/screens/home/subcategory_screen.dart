import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/model/get_all_product_categories.dart';
import 'package:afrimash/screens/home/indexed_product_category.dart';
import 'package:flutter/material.dart';

class SubcategoryScreen extends StatefulWidget {
  Object data;
  SubcategoryScreen({Key key, this.data}) : super(key: key);

  @override
  _SubcategoryScreenState createState() => _SubcategoryScreenState();
}

class _SubcategoryScreenState extends State<SubcategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Subcategories",
            style: CustomTheme.titleText3,
          ),
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onTap: () => Navigator.pop(context),
          ),
          brightness: Theme.of(context).brightness,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView.builder(
                    itemCount: widget.data.subCategories.length ?? null,
                    itemBuilder: (BuildContext context, int index) {
                      var category = widget.data.subCategories[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            print("${category.id}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        IndexedProductCategory(
                                            id: category.id)));
                          },
                          child: Text('${category.name}',
                              style: CustomTheme.listText),
                        ),
                      );
                    }))));
  }
}
