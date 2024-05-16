import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter_homework_1/model/product_model.dart';
import 'package:flutter_homework_1/screen/fav.dart';
import 'package:flutter_homework_1/service/api_service.dart';
import 'package:flutter_homework_1/screen/detail.dart';
import 'package:flutter_homework_1/ulti/serach.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  List<ProductElement> productList = [];
  List<bool> favList = [];

  void getProductList() async {
    Product? product = await getAllProduct();
    if (product != null) {
      productList = product.products;

      setState(() {});
    }
    for (int i = 0; i < productList.length; i++) {
      favList.add(false);
    }
  }

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
    ),
    TabItem(
      icon: Icons.search_sharp,
    ),
    TabItem(
      icon: Icons.favorite_border,
    ),
  ];

  int visit = 0;

  double height = 30;

  Color colorSelect = const Color(0XFF0686F8);

  Color color = const Color(0XFF7AC0FF);

  Color color2 = Colors.black;

  Color bgColor = Colors.white;

  Icon iC = Icon(Icons.favorite_border);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomBarInspiredOutside(
          items: items,
          backgroundColor: bgColor,
          color: color2,
          colorSelected: Colors.white,
          indexSelected: visit,
          onTap: (int index) => setState(() {
            visit = index;
            switch (visit) {
              case 0:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AllProduct()));
                break;
              case 1:
                showSearch(context: context, delegate: Search(productList));
                break;
              case 2:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Fav(index, productList, favList)));
            }
          }),
          top: -25,
          animated: true,
          itemStyle: ItemStyle.circle,
          chipStyle:
              const ChipStyle(notchSmoothness: NotchSmoothness.smoothEdge),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.redAccent,
                    ),
                    Positioned(
                        left: 2,
                        top: 2,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.white,
                          child: ClipOval(
                            child: Image.asset(
                              'images/flu.png',
                            ),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.68),
                    child: Text(
                      'Hi, Hridoy',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: width * 0.02),
                    child: Text(
                      'Chose your favourive Product',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                  ),
                  Container(
                    width: width * 0.95,
                    height: height * 0.065,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                    ),
                    child: InkWell(
                      onTap: () {
                        showSearch(
                            context: context, delegate: Search(productList));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Search Product',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.4)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 33,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 33,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                                onPressed: () {}, child: Text('All'))),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 33,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                                onPressed: () {}, child: Text('Phone'))),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 33,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                                onPressed: () {}, child: Text('Laptop'))),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 33,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                                onPressed: () {}, child: Text('Colour'))),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 3,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                                onPressed: () {}, child: Text('Brand'))),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.8,
                    height: height * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Detail(index, productList)));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 30),
                            child: Card(
                              child: Image.network(
                                productList[index].thumbnail,
                                width: width * 0.8,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Recommended For You',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Container(
              width: width * 0.8,
              height: height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Detail(index, productList)));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Card(
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  productList[index].thumbnail,
                                  width: width * 0.35,
                                  height: height * 0.12,
                                ),
                                Positioned(
                                    top: 5,
                                    right: 5,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          favList[index] = true;
                                        });
                                      },
                                      child: favList[index]
                                          ? Icon(
                                              Icons.favorite,
                                              color: Colors.red,
                                            )
                                          : Icon(
                                              Icons.favorite_border_outlined),
                                    )),
                              ],
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: width * 0.24),
                                child: Text(productList[index].brand)),
                            Padding(
                                padding: EdgeInsets.only(right: width * 0.24),
                                child: Text(
                                  '\$ ${productList[index].price.toString()}',
                                  style: TextStyle(
                                      color: Colors.black.withGreen(100),
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
