import 'package:flutter/material.dart';

import '../constants/colorPallet.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with TickerProviderStateMixin {
  bool _searchBtn = false;
  int _currentMenu = 0;
  late TabController _tabController;
  ScrollController _scrollController = ScrollController();
  TextEditingController _searchController = TextEditingController();

  List<String> _listMenuNotif = ['All', 'Unread', 'Favorite'];

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: !_searchBtn ? Text('Notification') : _searchTextField(),
          actions: !_searchBtn
              ? [
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        setState(() {
                          _searchBtn = true;
                        });
                      })
                ]
              : [
                  IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        setState(() {
                          _searchBtn = false;
                        });
                      })
                ],
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
                        text: 'Notification',
                      ),
                      Tab(
                        text: 'Message',
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListView(
                        children: [
                          Container(
                            width: _size.width,
                            height: 50,
                            color: Colors.transparent,
                            child: Center(
                              child: Text('Total: 0 Notification'),
                            ),
                          ),
                          Container(
                            width: _size.width,
                            height: 500,
                            color: Colors.transparent,
                            child: Center(
                              child: Text('Data Not Found!'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ListView(
                        children: [
                          Container(
                            width: _size.width,
                            height: 50,
                            color: Colors.transparent,
                            child: Center(
                              child: Text('Total: 0 Message'),
                            ),
                          ),
                          Container(
                            width: _size.width,
                            height: 500,
                            color: Colors.transparent,
                            child: Center(
                              child: Text('Data Not Found!'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // =============== NEW ARRIVAL ===============
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List<Widget>.generate(_listMenuNotif.length, (index) {
                  return InkWell(
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _currentMenu = index;
                      });
                    },
                    child: Container(
                      width: 100,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: _currentMenu == index
                              ? ColorPallet.greenPrimary
                              : Colors.black,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        _listMenuNotif[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: _currentMenu == index
                              ? ColorPallet.greenPrimary
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      cursorColor: Colors.white,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: 'Search',
        hintStyle: TextStyle(
          //Style of hintText
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }
}
