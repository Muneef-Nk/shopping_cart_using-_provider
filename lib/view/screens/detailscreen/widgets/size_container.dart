import 'package:flutter/material.dart';

class SizeContainer extends StatelessWidget {
  final String size;
  const SizeContainer({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey.shade500,
            width: 1,
          )),
      child: Center(
          child: Text(
        size,
        style: TextStyle(color: Colors.black, fontSize: 20),
      )),
    );
  }
}
