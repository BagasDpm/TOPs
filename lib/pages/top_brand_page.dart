import 'package:flutter/material.dart';
import 'package:tops/animations/page_transition.dart';
import 'package:tops/constants/colorPallet.dart';
import 'package:tops/constants/imagePallet.dart';
import 'package:tops/model/modelArrival.dart';
import 'package:tops/model/modelBestSeller.dart';
import 'package:tops/pages/detail_arrival_page.dart';

import 'detail_best_page.dart';

class TopBrandPage extends StatefulWidget {
  final String collectProduct;

  TopBrandPage({
    required this.collectProduct,
    super.key,
  });

  @override
  State<TopBrandPage> createState() => _TopBrandPageState();
}

class _TopBrandPageState extends State<TopBrandPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  ScrollController _scrollController = ScrollController();

  String _title = "Top Brands";

  List<String> imgListBrand = [
    brand0,
    brand1,
    brand2,
    brand3,
    brand4,
  ];

  @override
  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    if (widget.collectProduct == "Brands") {
      _tabController.animateTo(0);
    } else if (widget.collectProduct == "New") {
      _tabController.animateTo(1);
    } else if (widget.collectProduct == "Best Seller") {
      _tabController.animateTo(2);
    } else {
      _tabController.animateTo(0);
    }

    super.initState();
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _title = _tabController.index == 0
          ? 'Top Brands'
          : _tabController.index == 1
              ? 'New Arrival'
              : 'Best Seller';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: _size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorPallet.greenPrimary,
                  ),
                  labelColor: ColorPallet.whiteBasic,
                  unselectedLabelColor: Colors.white,
                  labelStyle: TextStyle(
                    fontSize: 14,
                  ),
                  tabs: [
                    Tab(
                      text: 'Brands',
                    ),
                    Tab(
                      text: 'New',
                    ),
                    Tab(
                      text: 'Best Seller',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: _size.width,
              height: _size.height,
              child: TabBarView(
                controller: _tabController,
                children: [
                  // ================ TOP BRANDS ===================
                  GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5.0,
                        shadowColor: Color.fromARGB(255, 231, 223, 223),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            imgListBrand[index],
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: imgListBrand.length,
                  ),

                  // =============== NEW ARRIVAL ===============
                  GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            AnimatedPageRouteLeft(
                              child: DetailArrivalPage(index: index),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 231, 223, 223),
                                blurRadius: 3,
                                spreadRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                listDataArrival[index].image,
                                filterQuality: FilterQuality.high,
                                width: 150,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      listDataArrival[index].nameBrand,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      listDataArrival[index].descBrand,
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
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30,
                    ),
                    itemCount: listDataArrival.length,
                  ),

                  // =================== BEST SELLER ==================
                  GridView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    scrollDirection: Axis.vertical,
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            AnimatedPageRouteLeft(
                              child: DetailBestPage(index: index),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 231, 223, 223),
                                blurRadius: 3,
                                spreadRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                listBestSeller[index].imageBest,
                                filterQuality: FilterQuality.high,
                                width: 150,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      listBestSeller[index].nameProduct,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      listBestSeller[index].descProduct,
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
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30,
                    ),
                    itemCount: listBestSeller.length,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
