import 'package:flutter/material.dart';
import 'package:flutter_homework_1/model/product_model.dart';

class Search extends SearchDelegate {
  List<ProductElement> proList = [];
  Search(this.proList);
  @override
  List<Widget>? buildActions(BuildContext context) {
    IconButton(
      onPressed: () {
        query = '';
      },
      icon: Icon(Icons.close),
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    List<ProductElement> resultList = proList
        .where((element) =>
            element.brand.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return resultList == 0
        ? Text('no data')
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
            ),
            itemCount: resultList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  child: Column(
                    children: [
                      Image.network(
                        resultList[index].thumbnail,
                        width: width * 0.4,
                        height: height * 0.12,
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: width * 0.1),
                          child: Text(resultList[index].brand)),
                      Padding(
                          padding: EdgeInsets.only(right: width * 0.24),
                          child: Text(
                            '\$ ${resultList[index].price.toString()}',
                            style: TextStyle(
                                color: Colors.black.withGreen(100),
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    List<ProductElement> suggList = proList;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
      ),
      itemCount: suggList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Card(
            child: Column(
              children: [
                Image.network(
                  suggList[index].thumbnail,
                  width: width * 0.4,
                  height: height * 0.12,
                ),
                Padding(
                    padding: EdgeInsets.only(right: width * 0.1),
                    child: Text(suggList[index].brand)),
                Padding(
                    padding: EdgeInsets.only(right: width * 0.24),
                    child: Text(
                      '\$ ${suggList[index].price.toString()}',
                      style: TextStyle(
                          color: Colors.black.withGreen(100),
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
