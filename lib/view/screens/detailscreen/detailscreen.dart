import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_card_using_provider/controller/details_screen_controller.dart';
import 'package:shopping_card_using_provider/model/card_model.dart';
import 'package:shopping_card_using_provider/view/add_to_card/add_to_card.dart';

import '../../../model/product_model.dart';
import 'widgets/size_container.dart';

class DetailsScreen extends StatelessWidget {
  final int index;
  DetailsScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    String description =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis posuere magna ut vestibulum. Proin eleifend velit massa, a laoreet lectus pulvinar non. Pellentesque sem est, blandit id nibh vel, pellentesque sagittis lorem. Nam id pharetra est. Vestibulum velit justo, vehicula et urna eu, efficitur congue nisl";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
            Provider.of<DetailsScreenController>(context, listen: false)
                .reset();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                      Provider.of<DetailsScreenController>(context)
                          .card
                          .length
                          .toString(),
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
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                product[index].image,
                width: double.infinity,
                height: 350,
                // fit: BoxFit.cover,
              ),
              Positioned(
                right: 20,
                top: 10,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.favorite_outline,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              product[index].name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                Text("4.5/5",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text("(34 reviews)"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "Choose size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                SizeContainer(size: "S"),
                SizeContainer(size: "M"),
                SizeContainer(size: "L"),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 206, 206, 205),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Price : ${product[index].price}",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Provider.of<DetailsScreenController>(context,
                                    listen: false)
                                .remove();
                            print('you clicked fun');
                          },
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          Provider.of<DetailsScreenController>(context)
                              .itemCount
                              .toString(),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Provider.of<DetailsScreenController>(context,
                                    listen: false)
                                .add();
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(7),
        height: 70,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(9),
            border: Border.all(color: Colors.grey.shade300)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Total: ₹ ${Provider.of<DetailsScreenController>(context, listen: false).totalPrice(index)}",
                style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: () {
                int quantity =
                    Provider.of<DetailsScreenController>(context, listen: false)
                        .itemCount;
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => AddtoCard()));

                print(quantity);

                if (Provider.of<DetailsScreenController>(context, listen: false)
                    .card
                    .any((element) => element.id == index)) {
                  print("card nd");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.orange,
                      content: Text("this item already added your card")));
                } else {
                  print('card illa');

                  Provider.of<DetailsScreenController>(context, listen: false)
                      .addCard(
                    CardModel(
                        title: product[index].name,
                        image: product[index].image,
                        price: product[index].price,
                        total: Provider.of<DetailsScreenController>(context,
                                listen: false)
                            .totalPrice(index),
                        description: description,
                        size: "M",
                        itemCount: quantity,
                        id: index),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("this item added your card")));
                }
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Add to Card",
                      style: TextStyle(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
