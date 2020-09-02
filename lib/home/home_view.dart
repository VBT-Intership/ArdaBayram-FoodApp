import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    List<String> foodList = List.generate(10, (index) => index.toString());
    return Scaffold(
      appBar: buildAppBar(),
      body: buildbody(foodList),
    );
  }

  SafeArea buildbody(List<String> foodList) {
    return SafeArea(
      child: Column(
        children: [
          buildSearchRow(),
          buildColumnProduct(foodList),
          buildPopularRow(),
          buildPopularList(foodList),
        ],
      ),
    );
  }

  SizedBox buildPopularList(List<String> foodList) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        itemCount: foodList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return buildListItem(context);
        },
      ),
    );
  }

  Container buildListItem(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: <Widget>[
            buildPopularListImage(context),
            buildPopularListText(context),
          ],
        ),
      ),
    );
  }

  Expanded buildPopularListText(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
        child: SizedBox(
            height: MediaQuery.of(context).size.width * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildPopularTextTitle(),
                Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    buildPopularTag("Gorengan", Colors.orange),
                    buildPopularTag("Makinan Ringan", Colors.blue),
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
                buildPopularInfo()
              ],
            )),
      ),
    );
  }

  Row buildPopularInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Warung buyakuk",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black26, fontSize: 12),
        ),
        Text(
          "Rp. 2.500",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Container buildPopularTag(String txt, Color tagColor) {
    return Container(
      child: Text(
        txt,
        style: TextStyle(color: tagColor, fontSize: 12),
      ),
      //
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: tagColor.withOpacity(0.10),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Text buildPopularTextTitle() {
    return Text(
      "Banana Goreng",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Card buildPopularListImage(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Image.network(
        "https://c.stocksy.com/a/RMl000/z9/182059.jpg",
        width: MediaQuery.of(context).size.width * 0.17,
        height: MediaQuery.of(context).size.width * 0.17,
        fit: BoxFit.cover,
      ),
    );
  }

  SizedBox buildPopularRow() {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          buildHearthButton(),
          buildPopularRowText(),
          Spacer(),
          buildRightArrowButton(),
        ],
      ),
    );
  }

  Container buildRightArrowButton() {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: FittedBox(
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.arrow_right,
            color: Colors.black,
          ),
          onPressed: null,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Container buildPopularRowText() {
    return Container(
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Row(
            children: [Text("Monggo, entekno duwekmu!")],
          ),
        ],
      ),
    );
  }

  Container buildHearthButton() {
    return Container(
      height: 60,
      width: 60,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      child: FittedBox(
        child: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          onPressed: null,
          backgroundColor: Colors.redAccent,
        ),
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
        children: <Widget>[buildCListImage(), buildCListText()],
      ),
    );
  }

  Row buildCListText() {
    return Row(
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
    );
  }

  Container buildCListImage() {
    return Container(
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
            buildBackButton(),
            buildCategoryButton(),
          ],
        ),
      ),
    );
  }

  IconButton buildBackButton() {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      onPressed: null,
    );
  }

  Transform buildCategoryButton() {
    return Transform.rotate(
      angle: 180 * math.pi / 180,
      child: IconButton(
        icon: Icon(
          Icons.short_text,
          color: Colors.black,
        ),
        onPressed: null,
      ),
    );
  }
}
