import 'package:animate_do/animate_do.dart';
import 'package:app_shoes/consts.dart';
import 'package:app_shoes/models/shoes_model.dart';
import 'package:app_shoes/pages/details_page.dart';
import 'package:app_shoes/pages/my_cart.dart';
import 'package:app_shoes/pages/my_favorite.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Shoes Shop',
              style:TextStyle(color: Colors.black, fontSize: 16),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyCart()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.money,
                      color: Colors.blue,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      'Pay',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavorite()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 30),
                child: favoriteitems.isNotEmpty
                    ? Badge(
                        badgeContent: Text(
                          favoriteitems.length.toString(),
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.black,
                          size: 28,
                        ),
                      )
                    : const Icon(
                        Icons.favorite,
                        color: Colors.black,
                        size: 28,
                      ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TabBar(
                  controller: _controller,
                  unselectedLabelStyle: TextStyle(fontSize: 12),
                  labelStyle: TextStyle(fontSize: 12),
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue),
                  unselectedLabelColor: Colors.grey.shade800,
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'Sport',
                    ),
                    Tab(
                      text: 'Men',
                    ),
                    Tab(
                      text: 'Women',
                    ),
                  ]),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(controller: _controller, children: [
                  _buildlistitem(items: allshoes),
                  _buildlistitem(items: sportshoeslist),
                  _buildlistitem(items: menshoeslist),
                  _buildlistitem(items: womenshoeslist),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildlistitem({required List<ShoesModel> items}) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? BounceInLeft(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index))
              : BounceInRight(
                  duration: const Duration(milliseconds: 1000),
                  child: _builditem(myitems: items, index: index));
        });
  }

  Widget _builditem({required List<ShoesModel> myitems, required int index}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => DetailsPage(
                      item: myitems[index],
                    )));
      },
      child: AspectRatio(
        aspectRatio: 3 / 2.3,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: myitems[index].color,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 10, color: Colors.grey, offset: Offset(0, 10))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    myitems[index].img,
                    fit: BoxFit.cover,
                    width: 130,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          myitems[index].name,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              myitems[index].isselected =
                                  !myitems[index].isselected;
                            });
                            myitems[index].isselected
                                ? favoriteitems.add(myitems[index])
                                : favoriteitems.remove(myitems[index]);
                          },
                          child: Icon(
                            Icons.favorite_sharp,
                            color:
                                myitems[index].isselected ? Colors.red : white,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      myitems[index].company,
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                    const Spacer(),
                    Text(
                      '${myitems[index].price} \$',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
