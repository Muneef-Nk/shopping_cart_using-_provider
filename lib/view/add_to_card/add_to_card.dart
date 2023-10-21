import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/product_card_controller.dart';

class AddtoCard extends StatelessWidget {
  AddtoCard({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductCardController>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          title: Text("Cart",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        body: provider.card.isEmpty
            ? Center(
                child: Text(
                "Your Cart is empty",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold),
              ))
            : ListView.builder(
                itemCount: provider.card.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: Container(
                      margin: EdgeInsets.only(top: 20),
                      color: Colors.red,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            "delete",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    key: Key('${provider.card}'),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      Provider.of<ProductCardController>(context, listen: false)
                          .removeCard(index);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("This item remove your card")));
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
                                provider.card[index].image,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${provider.card[index].title}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${provider.card[index].description} ?? "nn',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey[900],
                                    ),
                                    maxLines: 2,
                                  ),
                                  Text(
                                    'Price : ${provider.card[index].price}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Size : ${provider.card[index].size}',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    // mainAxisAlignment:
                                    // MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                          child: Text(
                                            '${provider.card[index].total}',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Provider.of<ProductCardController>(
                                                    context,
                                                    listen: false)
                                                .removeTotal(index);

                                            print('remove total');
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          )),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        provider.card[index].itemCount < 10
                                            ? '0${provider.card[index].itemCount}'
                                            : '${provider.card[index].itemCount}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            Provider.of<ProductCardController>(
                                                    context,
                                                    listen: false)
                                                .addTotal(index);
                                          },
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              size: 15,
                                            ),
                                          ))
                                    ],
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
      ),
    );
  }
}
