import 'package:flutter/material.dart';
import 'package:flutter_homework_1/model/product_model.dart';

class Detail extends StatelessWidget {
  int index;
  List<ProductElement> newList = [];
  Detail(this.index, this.newList);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                child: Image.network(newList[index].thumbnail)),
            Center(
              child: Column(
                children: [
                  Text(
                    'Brand',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    newList[index].brand,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(newList[index].category),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.06),
              child: Row(
                children: [
                  Text(
                    'Price -',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    '\$ ${newList[index].price.toString()}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withGreen(80)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                newList[index].description,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
