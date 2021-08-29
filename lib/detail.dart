import 'package:flutter/material.dart';
import 'package:store/extensions/color_hex.dart';
import 'package:store/models/product.dart';

/// 产品详情页面

class ProductDetailPage extends StatefulWidget {
  Product product;

  ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState(product);
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Product product;

  _ProductDetailPageState(this.product) : super();

  int _selectedStyleIndex = 0;

  @override
  Widget build(BuildContext context) {
    double navigationBarBottom = MediaQuery.of(context).padding.top + 64;
    double bodyHeight =
        MediaQuery.of(context).size.height - navigationBarBottom;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor.fromHex('F3F6F8'),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor.fromHex('F3F6F8'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            left: 0,
            right: 0,
            top: bodyHeight * 0.5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 35),
              color: Colors.white,
              width: screenWidth,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 88,
                        ),
                        Text(
                          product.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Flexible(
                          child: SingleChildScrollView(
                            child: Text(
                              product.description,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 22,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: product.styles[_selectedStyleIndex].color,
                          ),
                          onPressed: () {},
                          child: Container(
                            height: 44,
                            child: Center(
                              child: Text('加入购物车',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: product
                                        .styles[_selectedStyleIndex].color
                                        .computeLuminance() > 0.5 ? Colors
                                        .black87 : Colors.white,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom + 24,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 100,
            width: 360,
            height: 360,
            child: Hero(
              tag: product.image,
              child: Image(
                image: AssetImage(product.styles[_selectedStyleIndex].image),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(left: 35, top: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    style: TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    '售价',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '￥${product.formatPrice()} 起',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    '可选颜色',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Row(
                    children: List.generate(product.styles.length, (index) {
                      return productStyleItem(product.styles[index]);
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget productStyleItem(ProductStyle style) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, right: 14),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: style.color,
            ),
            width: 24,
            height: 24,
            child: Center(
              child: Opacity(
                opacity: (product.styles[_selectedStyleIndex] == style ? 1 : 0),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  onPressed: () {
                    setState(() {
                      _selectedStyleIndex = product.styles
                          .indexWhere((element) => element == style);
                    });
                  },
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
