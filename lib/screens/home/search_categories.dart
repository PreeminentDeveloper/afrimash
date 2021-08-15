import 'package:flutter/material.dart';

class SearchCategories extends StatefulWidget {
  // const SearchCategories({ Key? key }) : super(key: key);

  @override
  _SearchCategoriesState createState() => _SearchCategoriesState();
}

class _SearchCategoriesState extends State<SearchCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 20,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade200),
                width: MediaQuery.of(context).size.width - 90,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Search for Items",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 25)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
