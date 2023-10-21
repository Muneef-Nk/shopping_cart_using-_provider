import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_card_using_provider/controller/home_controller.dart';
import 'package:shopping_card_using_provider/controller/product_card_controller.dart';
import 'package:shopping_card_using_provider/controller/saved_product_controller.dart';
import 'package:shopping_card_using_provider/view/add_to_card/add_to_card.dart';
import 'package:shopping_card_using_provider/view/screens/detailscreen/detailscreen.dart';

import '../../../model/product_model.dart';
// import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductCardController>(context);
    var providerSaved = Provider.of<SavedProductController>(context);
    var homeConroller = Provider.of<HomeScreenController>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Discover",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddtoCard()));
            },
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 6,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.pink),
                    child: Center(
                        child: Text(
                      provider.card.length.toString(),
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: "Search anything",
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.filter_list,
                    size: 40,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 15),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeConroller.label.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      homeConroller.changeCategory(index);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 15),
                      width: 80,
                      decoration: BoxDecoration(
                          color: homeConroller.currentCategoryIndex == index
                              ? Colors.black
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text(
                        homeConroller.label[index],
                        style: TextStyle(
                            color: homeConroller.currentCategoryIndex == index
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 20,
          ),
          GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: product.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: .7),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              index: index,
                            )));

                    Provider.of<ProductCardController>(context, listen: false);
                    // .checkTotal();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: 200,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 228, 224, 224),
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              product[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 10,
                          child: GestureDetector(
                            onTap: () {
                              //
                              providerSaved.addSaved(index);
                            },
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                child: providerSaved.isExist(index)
                                    ? Icon(
                                        Icons.favorite,
                                        size: 30,
                                        color: Colors.red,
                                      )
                                    : Icon(Icons.favorite_outline, size: 30)),
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          bottom: 5,
                        ),
                        child: Text(
                          product[index].name,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "${product[index].price}",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              })
        ]),
      ),
    );
  }
}
