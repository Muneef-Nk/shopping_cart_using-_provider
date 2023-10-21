import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_card_using_provider/controller/saved_product_controller.dart';
import 'package:shopping_card_using_provider/model/product_model.dart';
import 'package:shopping_card_using_provider/view/screens/detailscreen/detailscreen.dart';

class SavedProduct extends StatelessWidget {
  const SavedProduct({super.key});

  @override
  Widget build(BuildContext context) {
    var savedProvider = Provider.of<SavedProductController>(context);
    return Scaffold(
      body: savedProvider.favorite.isEmpty
          ? Center(
              child: Text(
              "There's  nothing here",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold),
            ))
          : ListView.builder(
              itemCount: savedProvider.favorite.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                              index: savedProvider.favorite[index],
                            )));
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 15, right: 15),
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 216, 216, 215),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 130,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 207, 207, 205),
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              product[savedProvider.favorite[index]].image,
                              // provider.card[index].image,
                              // product[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${product[savedProvider.favorite[index]].name}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 15),
                                      child: GestureDetector(
                                        onTap: () {
                                          savedProvider.removeSaved(index);
                                        },
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  'Price : ${product[savedProvider.favorite[index]].price}',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Versions of the Lorem ipsum text have been used in typesetting at least since the 1960s, when it ',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
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
              }),
    );
  }
}
