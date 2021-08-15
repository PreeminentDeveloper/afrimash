import 'package:afrimash/helper/theme.dart';
import 'package:afrimash/screens/home/search_categories.dart';
import 'package:afrimash/service/get_all_product_categories_service.dart';
import 'package:flutter/material.dart';
import 'package:inspireui/widgets/loading.dart';

class CategoriesScreen extends StatefulWidget {
  // const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  bool loading = false;
  GetAllProductCategoriesService getAllProductCategoriesService =
      GetAllProductCategoriesService();

  @override
  void initState() {
    super.initState();
    getCategories();
  }

  getCategories() async {
    setState(() => loading = true);
    try {
      var response = await getAllProductCategoriesService.getCategories();
      var success = response["success"];
      if (success == false) {
        setState(() => loading = false);
      } else {
        setState(() => loading = false);
        print(response["message"]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final _category_list = [
      {
        "name": "Farm Equipments",
      },
      {
        "name": "Poultry Equipments",
      },
      {
        "name": "Veterinary Medicines",
      },
      {
        "name": "Poultry Equipments",
      },
      {
        "name": "Poultry Feeders  ",
      },
      {
        "name": "Livestock",
      },
      {
        "name": "Farm Equipments",
      },
      {
        "name": "Poultry Equipments",
      },
      {
        "name": "Veterinary Medicines",
      },
      {
        "name": "Poultry Equipments",
      },
      {
        "name": "Poultry Feeders  ",
      },
      {
        "name": "Livestock",
      },
      {
        "name": "Farm Equipments",
      },
      {
        "name": "Poultry Equipments",
      },
      {
        "name": "Veterinary Medicines",
      },
      {
        "name": "Poultry Equipments",
      },
      {
        "name": "Poultry Feeders  ",
      },
      {
        "name": "Livestock",
      },
    ];

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                "Categories",
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
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchCategories())),
                )
              ],
            ),
            body: SafeArea(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                        // itemCount: _category_list.length,
                        itemCount: getAllProductCategoriesService
                                .getAllProductCategories.object.length ??
                            null,
                        itemBuilder: (BuildContext context, int index) {
                          var category = getAllProductCategoriesService
                              .getAllProductCategories.object[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 10),
                            child: InkWell(
                              onTap: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('${category.name}',
                                      style: CustomTheme.listText),
                                  !category.subCategories.isEmpty
                                      ? Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 15,
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          );
                        }))));
  }
}
