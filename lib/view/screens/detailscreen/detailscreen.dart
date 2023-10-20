import 'package:flutter/material.dart';

import '../../../model/product_model.dart';
import 'widgets/size_container.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        title: Text(
          "Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Stack(
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
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.pink),
                  child: Center(
                      child: Text(
                    "9",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 10),
              //   height: 200,
              //   decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 228, 224, 224),
              //       borderRadius: BorderRadius.circular(15)),
              //   child: Image.network(
              //     product[0].image,width: double.infinity,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              Image.network(
                product[0].image,
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
              "Muneef",
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
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam mollis posuere magna ut vestibulum. Proin eleifend velit massa, a laoreet lectus pulvinar non. Pellentesque sem est, blandit id nibh vel, pellentesque sagittis lorem. Nam id pharetra est. Vestibulum velit justo, vehicula et urna eu, efficitur congue nisl",
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
          )
        ],
      )),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    "PKR 1230",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Add to Card",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
