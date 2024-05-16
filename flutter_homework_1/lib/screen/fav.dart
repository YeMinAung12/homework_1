import 'package:flutter/material.dart';
import 'package:flutter_homework_1/model/product_model.dart';

class Fav extends StatelessWidget {
  List<ProductElement> proList = [];
  List<bool> fav = [];
  int index;
  Fav(this.index, this.proList, this.fav);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: fav.length,
            itemBuilder: (BuildContext context, int index) {
              return fav[index] != null && fav[index] == false
                  ? ListTile(
                      leading: Image.network(
                        proList[index].thumbnail,
                        width: 80,
                      ),
                      title: Text(proList[index].brand),
                      subtitle: Text(proList[index].price.toString()),
                      trailing: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  : null;
            }));
  }
}
