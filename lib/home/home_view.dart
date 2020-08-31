import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<String> categoryList = List.generate(10, (index) => index.toString());
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            buildSearchRow(),
            buildColumnProduct(categoryList),
            buildPopularRow(),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: categoryList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child:
                                Image.network("https://picsum.photos/200/200"),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Banana Goreng",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                        height: 18,
                                        width: 60,
                                        child: Center(
                                          child: Container(
                                            child:
                                                Center(child: Text("Gorengan")),
                                            color: Colors.orangeAccent,
                                          ),
                                        )),
                                    SizedBox(
                                        height: 18,
                                        width: 150,
                                        child: Center(
                                          child: Container(
                                            padding:
                                                EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Center(
                                                child: Text("Makanan Ringan")),
                                            color: Colors.blueAccent,
                                          ),
                                        )),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child:
                                          Center(child: Text("Warung buyakuk")),
                                    ),
                                    // Spacer(),
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(100, 0, 5, 0),
                                      child: Center(
                                          child: Text(
                                        "Rp. 2.500",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                    // SizedBox(
                                    //   height: 18,
                                    //   width: 60,
                                    //   child: Container(
                                    //     child: Center(
                                    //         child: Text("Warung buyakuk")),
                                    //   ),
                                    // ),
                                    // Spacer(),
                                    // SizedBox(
                                    //     height: 18,
                                    //     width: 150,
                                    //     child: Center(
                                    //       child: Container(
                                    //         padding:
                                    //             EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    //         child: Center(
                                    //             child: Text("Makanan Ringan")),
                                    //         color: Colors.blueAccent,
                                    //       ),
                                    //     )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox buildPopularRow() {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: FittedBox(
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: null,
                backgroundColor: Colors.redAccent,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Popular",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [Text("Monggo, entekno duwekmu!")],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: FittedBox(
              child: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onPressed: null,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildSearchRow() {
    return SizedBox(
      height: 100,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    "What you want to eat today?",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ))),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: null,
              backgroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Column buildColumnProduct(List<String> categoryList) {
    return Column(
      children: [cList(categoryList)],
    );
  }

  SizedBox cList(List<String> categoryList) {
    return SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              child: cListCard(categoryList, index),
            );
          },
        ));
  }

  Card cListCard(List<String> categoryList, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              "https://media.istockphoto.com/photos/donut-with-sprinkles-isolated-picture-id538335769",
              fit: BoxFit.cover,
              height: 140,
              width: 140,
              alignment: Alignment.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 2, 2, 0),
                child: Text("Sweets -"),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
                  child: Text(
                    "12 Item",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          )
        ],
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(40),
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: null,
            ),
            Transform.rotate(
              angle: 180 * math.pi / 180,
              child: IconButton(
                icon: Icon(
                  Icons.short_text,
                  color: Colors.black,
                ),
                onPressed: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
