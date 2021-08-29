import 'dart:math';

import 'package:flutter/material.dart';
import 'package:store/detail.dart';
import 'package:store/models/category.dart';
import 'package:store/models/product.dart';
import 'extensions/color_hex.dart';
import 'extensions/color_random.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// 分类列表
  List<Category> _categoryList = [
    Category.speak(),
    Category.headphone(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('大家好',
            style: TextStyle(
              color: Colors.black87,
            )),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  '按分类浏览',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 248,

                /// 分类列表
                child: ListView.builder(
                  itemBuilder: (builder, index) {
                    return categoryCard(_categoryList[index]);
                  },
                  itemCount: _categoryList.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text('猜你喜欢',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    )),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(
                  15, 15, 15, MediaQuery.of(context).padding.bottom + 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 145 / 209,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return productCard(
                        _categoryList[_selectedIndex].products[index]);
                  },
                  childCount: 4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget categoryCard(Category category) {
    double width = 235;
    double height = 248;
    double imageWidth = 205;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex =
              _categoryList.indexWhere((element) => category == element);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                child: Image(
                  image: AssetImage('assets/images/bg_card.png'),
                  width: imageWidth,
                  height: 200,
                )),
            Positioned(
                child: Image(
              image: AssetImage(category.image),
              width: imageWidth,
              height: 160,
            )),
            Positioned(
                bottom: 24,
                child: Container(
                  width: imageWidth,
                  child: Column(
                    children: [
                      Text(
                        category.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: HexColor.fromHex('171717'),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(category.intro,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blueGrey,
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget productCard(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(pageBuilder: (context,
            animation, secondaryAnimation) {
          return FadeTransition(
              opacity: animation as Animation<double>,
            child: ProductDetailPage(product: product),
          );
        })
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: HexColor.fromHex('F3F6F8'),
        ),
        width: 200,
        height: 200,
        child: Column(
          children: [
            Hero(
              tag: product.image,
              child: Image(
                image: AssetImage(product.image),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                product.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '￥${product.formatPrice()}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
