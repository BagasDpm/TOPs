import 'package:flutter/material.dart';
import 'package:tops/constants/colorPallet.dart';
import 'package:tops/constants/imagePallet.dart';
import 'package:tops/model/modelArrival.dart';
import 'package:tops/model/modelBestSeller.dart';
import 'package:tops/utility/util.dart';

import '../animations/page_transition.dart';
import 'notification_page.dart';

class DetailBestPage extends StatefulWidget {
  final int index;
  DetailBestPage({
    required this.index,
    super.key,
  });

  @override
  State<DetailBestPage> createState() => _DetailBestPageState();
}

class _DetailBestPageState extends State<DetailBestPage> {
  int _currentSize = 0;
  ScrollController _scrollController = ScrollController();
  int decimalDigit = 0;

  List<String> _listSize = ['41', '42', '43', '44', '45'];

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          logo,
          width: 80,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                AnimatedPageRouteDiagonal(
                  child: NotificationPage(),
                ),
              );
            },
            icon: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.notifications_on_outlined),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          ListView(
            scrollDirection: Axis.vertical,
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                width: _size.width,
                height: 250,
                color: Colors.transparent,
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  listBestSeller[widget.index].imageBest,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(
                      listBestSeller[widget.index].nameProduct,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        listBestSeller[widget.index].descProduct,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 147, 147, 147),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Text(
                        textAlign: TextAlign.center,
                        listBestSeller[widget.index].descDetailBrand,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 147, 147, 147),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 40,
                  bottom: 50,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Size',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children:
                          List<Widget>.generate(_listSize.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _currentSize = index;
                            });
                          },
                          child: Container(
                            width: 45,
                            height: 45,
                            margin: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                              color: _currentSize == index
                                  ? ColorPallet.greenPrimary
                                  : ColorPallet.whiteBasic,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 206, 206, 206),
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                  blurStyle: BlurStyle.inner,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  _listSize[index],
                                  style: TextStyle(
                                    color: _currentSize == index
                                        ? ColorPallet.whiteBasic
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: _size.width,
            height: 70,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 206, 206, 206),
                        blurRadius: 2,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.inner,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(Icons.message_outlined),
                ),
                Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 206, 206, 206),
                        blurRadius: 2,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.inner,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Buy Now'),
                      Text(
                        CurrencyFormat.convertToIdr(
                          int.parse(listBestSeller[widget.index].price),
                          0,
                        ),
                        style: TextStyle(
                          color: ColorPallet.greenPrimary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ColorPallet.greenPrimary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 206, 206, 206),
                        blurRadius: 2,
                        spreadRadius: 1,
                        blurStyle: BlurStyle.inner,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: ColorPallet.whiteBasic,
                        ),
                      ),
                      Text(
                        CurrencyFormat.convertToIdr(
                          int.parse(listBestSeller[widget.index].price),
                          0,
                        ),
                        style: TextStyle(
                          color: ColorPallet.whiteBasic,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
