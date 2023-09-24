import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:tops/animations/page_transition.dart';
import 'package:tops/constants/colorPallet.dart';
import 'package:tops/constants/imagePallet.dart';
import 'package:tops/model/components/modelComponentProfile.dart';
import 'package:tops/model/modelArrival.dart';
import 'package:tops/model/modelBestSeller.dart';
import 'package:tops/pages/detail_arrival_page.dart';
import 'package:tops/pages/notification_page.dart';
import 'package:tops/pages/top_brand_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tops/utility/util.dart';

import 'pages/detail_best_page.dart';

class dashScreen extends StatefulWidget {
  final int index;
  dashScreen({
    super.key,
    required this.index,
  });
  @override
  State<dashScreen> createState() => _dashScreenState();
}

class _dashScreenState extends State<dashScreen> with TickerProviderStateMixin {
  int _currentPage = 0;
  int _selectIconNav = 1;
  int _itemValue = 0;
  bool _isChecked = false;
  late Timer _timer;
  PageController _imageControllerTop = PageController();
  ScrollController _scrollController = ScrollController();

  Future<void> _refresh() {
    return Future.delayed(
      Duration(seconds: 4),
    );
  }

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  List<String> imgListTop = [
    sliderTop0,
    sliderTop1,
    sliderTop2,
    sliderTop3,
  ];

  List<String> imgListBrand = [
    brand0,
    brand1,
    brand2,
    brand3,
    brand4,
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < imgListTop.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _imageControllerTop.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 100),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        primary: true,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 30),
          child: Transform.scale(
            scale: 3,
            child: Image.asset(logo),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                AnimatedPageRouteDiagonal(
                  child: NotificationPage(),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.notifications_on_outlined),
            ),
          ),
        ],
      ),
      body: FutureBuilder(builder: (context, index) {
        switch (_selectIconNav) {
          case 0:
            return RefreshIndicator(
              onRefresh: _refresh,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              color: ColorPallet.greenPrimary,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: ColorPallet.whiteBasic,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      width: _size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 219, 219, 219),
                            blurRadius: 5,
                            spreadRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 10.0,
                            verticalDirection: VerticalDirection.down,
                            direction: Axis.vertical,
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                  color: ColorPallet.whiteBasic,
                                  fontSize: 15,
                                ),
                              ),
                              if (_isChecked)
                                Text(
                                  CurrencyFormat.convertToIdr(
                                    int.parse('5500000'),
                                    0,
                                  ),
                                  style: TextStyle(
                                    color: ColorPallet.whiteBasic,
                                    fontSize: 16,
                                  ),
                                ),
                              if (!_isChecked)
                                Text(
                                  CurrencyFormat.convertToIdr(
                                    int.parse('0'),
                                    0,
                                  ),
                                  style: TextStyle(
                                    color: ColorPallet.whiteBasic,
                                    fontSize: 16,
                                  ),
                                ),
                            ],
                          ),
                          if (_isChecked)
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: ColorPallet.whiteBasic,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallet.greenPrimary,
                                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          if (!_isChecked)
                            ElevatedButton(
                              onPressed: null,
                              child: Text(
                                'Buy Now',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 193, 192, 192),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                disabledBackgroundColor:
                                    Color.fromARGB(255, 234, 233, 233),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20, top: 20),
                          child: _isChecked
                              ? Text(
                                  'Delete',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: ColorPallet.greenPrimary,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Container(
                        width: _size.width * 0.85,
                        height: 170,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 219, 219, 219),
                              blurRadius: 5,
                              spreadRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
                                ),
                                Container(
                                  color: Colors.transparent,
                                  child: Image.asset(
                                    arrival0,
                                    width: 140,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    verticalDirection: VerticalDirection.down,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(
                                        'Air Jordan',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Text(
                                          'Air Jordan 1 High 85 Black White',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 147, 147, 147),
                                          ),
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        child: Text(
                                          CurrencyFormat.convertToIdr(
                                            int.parse('5500000'),
                                            0,
                                          ),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // Row Button Delete
                            Container(
                              width: _size.width,
                              height: 50,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Ink(
                                    decoration: ShapeDecoration(
                                      shape: CircleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_itemValue == 0) {
                                            _itemValue = 0;
                                          } else {
                                            _itemValue--;
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        FontAwesomeIcons.circleMinus,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    _itemValue.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _itemValue++;
                                      });
                                    },
                                    icon: Icon(FontAwesomeIcons.circlePlus),
                                    style: IconButton.styleFrom(
                                      side: BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          case 1:
            return RefreshIndicator(
              onRefresh: _refresh,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              color: ColorPallet.greenPrimary,
              strokeWidth: 3,
              child: ListView(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    height: 50,
                    width: _size.width,
                    alignment: Alignment.centerLeft,
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Hello, Gerald Vincent',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  // ==================== Slider Top ====================
                  Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 250,
                        color: Colors.transparent,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          controller: _imageControllerTop,
                          onPageChanged: _onChanged,
                          itemBuilder: (context, int index) {
                            return SizedBox(
                              child: Image.asset(
                                imgListTop[index],
                              ),
                            );
                          },
                          itemCount: imgListTop.length,
                        ),
                      ),
                      Positioned(
                        top: 195,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(
                            imgListTop.length,
                            (int index) {
                              return AnimatedContainer(
                                duration: Duration(milliseconds: 500),
                                height: 10,
                                width: (index == _currentPage) ? 30 : 10,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 30,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage)
                                      ? ColorPallet.whiteBasic
                                      : ColorPallet.lightGrey,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  // ================= Slider Top Brands ===================
                  Container(
                    width: _size.width,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(AnimatedPageRouteLeft(
                                child: TopBrandPage(
                                  collectProduct: 'Brands',
                                ),
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Top Brands',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Container(
                            color: Colors.transparent,
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 200,
                                scrollDirection: Axis.horizontal,
                                scrollPhysics: BouncingScrollPhysics(),
                                autoPlay: false,
                                aspectRatio: 16 / 9,
                                enlargeCenterPage: false,
                                enableInfiniteScroll: false,
                                initialPage: 0,
                                viewportFraction: 0.5,
                                autoPlayCurve: Curves.easeInOut,
                              ),
                              items: imgListBrand
                                  .map(
                                    (item) => Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Image.asset(
                                          item,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      color: Colors.white,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ================ SLider New Arrival ==================
                  Container(
                    width: _size.width,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(AnimatedPageRouteLeft(
                                child: TopBrandPage(
                                  collectProduct: 'New',
                                ),
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'New Arrival',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.transparent,
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                              height: 250,
                              scrollDirection: Axis.horizontal,
                              scrollPhysics: BouncingScrollPhysics(),
                              autoPlay: false,
                              aspectRatio: 16 / 9,
                              enlargeCenterPage: false,
                              enableInfiniteScroll: false,
                              initialPage: 0,
                              viewportFraction: 0.55,
                              autoPlayCurve: Curves.easeInOut,
                            ),
                            itemBuilder: ((context, index, realIndex) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    AnimatedPageRouteLeft(
                                      child: DetailArrivalPage(index: index),
                                    ),
                                  );
                                },
                                child: Container(
                                  width: 250,
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          listDataArrival[index].image,
                                          filterQuality: FilterQuality.high,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                listDataArrival[index]
                                                    .nameBrand,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                listDataArrival[index]
                                                    .descBrand,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 147, 147, 147)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                            itemCount: listDataArrival.length,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ================ SLider Best Seller ==================
                  Container(
                    width: _size.width,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 40, 15, 30),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(AnimatedPageRouteLeft(
                                child: TopBrandPage(
                                  collectProduct: 'Best Seller',
                                ),
                              ));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Best Seller',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Icon(
                                  FontAwesomeIcons.angleRight,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: List<Widget>.generate(listBestSeller.length,
                              (index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  AnimatedPageRouteLeft(
                                    child: DetailBestPage(index: index),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  width: _size.width * 0.9,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: ColorPallet.whiteBasic,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 60,
                                        height: 100,
                                        child: Center(
                                          child: Text(
                                            listBestSeller[index].numBest,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 25,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              listBestSeller[index].imageBest,
                                              width: 100,
                                            ),
                                            SizedBox(width: 8),
                                            SizedBox(
                                              width: _size.width * 0.40,
                                              child: Text(
                                                listBestSeller[index]
                                                    .descProduct,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
            );
          default:
            return Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(15.0),
              color: ColorPallet.whiteBasic,
              child: ListView(
                scrollDirection: Axis.vertical,
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: _size.width * 0.85,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 219, 219, 219),
                            blurRadius: 5,
                            spreadRadius: 3,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: ColorPallet.greenPrimary,
                              ),
                              child: Icon(
                                FontAwesomeIcons.user,
                                color: ColorPallet.whiteBasic,
                                size: 38,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'Gerald Vincent'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ========= Profile Account =======
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Wrap(
                      direction: Axis.vertical,
                      verticalDirection: VerticalDirection.down,
                      spacing: 5.0,
                      children: [
                        Text(
                          'Account',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        ModelComponentProfile(
                          prefixIconComp: FontAwesomeIcons.user,
                          textComp: 'Change Profile',
                          suffixIconComp: FontAwesomeIcons.angleRight,
                          actionTo: () {},
                        ),
                      ],
                    ),
                  ),

                  // ============== Divider ============
                  Divider(
                    height: 60,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                    color: ColorPallet.lightGrey,
                  ),

                  // ========= Profile Security =======
                  Wrap(
                    direction: Axis.vertical,
                    verticalDirection: VerticalDirection.down,
                    spacing: 5.0,
                    children: [
                      Text(
                        'Security',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      ModelComponentProfile(
                        prefixIconComp: Icons.lock_outline,
                        textComp: 'Change PIN Number',
                        suffixIconComp: FontAwesomeIcons.angleRight,
                        actionTo: () {},
                      ),
                      ModelComponentProfile2(
                        prefixIconComp: FontAwesomeIcons.fingerprint,
                        textComp: 'Fingerprint',
                      ),
                    ],
                  ),
                  // ============== Divider ============
                  Divider(
                    height: 60,
                    thickness: 2,
                    indent: 0,
                    endIndent: 0,
                    color: ColorPallet.lightGrey,
                  ),

                  // ========= Profile Information =======
                  Wrap(
                    direction: Axis.vertical,
                    verticalDirection: VerticalDirection.down,
                    spacing: 5.0,
                    children: [
                      Text(
                        'Information',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      ModelComponentProfile(
                        prefixIconComp: FontAwesomeIcons.circleQuestion,
                        textComp: 'FAQ',
                        suffixIconComp: FontAwesomeIcons.angleRight,
                        actionTo: () {},
                      ),
                      ModelComponentProfile(
                        prefixIconComp: Icons.info_outline,
                        textComp: "About TOP's",
                        suffixIconComp: FontAwesomeIcons.angleRight,
                        actionTo: () {},
                      ),
                      ModelComponentProfile(
                        prefixIconComp: Icons.file_open_outlined,
                        textComp: "Terms & Conditions TOP's",
                        suffixIconComp: FontAwesomeIcons.angleRight,
                        actionTo: () {},
                      ),
                      ModelComponentProfile(
                        prefixIconComp: Icons.shield_outlined,
                        textComp: "Privacy Policy TOP's",
                        suffixIconComp: FontAwesomeIcons.angleRight,
                        actionTo: () {},
                      ),
                      ModelComponentProfile(
                        prefixIconComp: Icons.star_outline_sharp,
                        textComp: "Rate for TOP's",
                        suffixIconComp: FontAwesomeIcons.angleRight,
                        actionTo: () {},
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: ModelComponentProfile(
                          prefixIconComp: Icons.chat_outlined,
                          textComp: "Customer Service",
                          suffixIconComp: FontAwesomeIcons.angleRight,
                          actionTo: () {},
                        ),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () {
                      logOut(context);
                    },
                    child: Center(
                      child: Text('Logout'),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallet.greenPrimary,
                      padding: EdgeInsets.all(20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
      }),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Colors.black.withOpacity(0.5),
        circleColor: ColorPallet.greenPrimary,
        inactiveIconColor: ColorPallet.whiteBasic,
        activeIconColor: ColorPallet.whiteBasic,
        textColor: ColorPallet.whiteBasic,
        tabs: [
          TabData(
            iconData: Icons.shopping_cart_outlined,
            title: "Cart",
          ),
          TabData(
            iconData: Icons.home_outlined,
            title: "Home",
          ),
          TabData(
            iconData: Icons.person_outline,
            title: "Profile",
          ),
        ],
        initialSelection: 1,
        onTabChangedListener: (index) {
          setState(() {
            _selectIconNav = index;
          });
        },
      ),
    );
  }
}
