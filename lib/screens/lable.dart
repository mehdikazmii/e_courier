import 'package:flutter/material.dart';

class Lable extends StatelessWidget {
  final String name, cityTo, cityFrom, phone, shipperAddress, address, price;

  const Lable(
      {super.key,
      required this.name,
      required this.cityTo,
      required this.cityFrom,
      required this.phone,
      required this.shipperAddress,
      required this.address,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Card(
          child: SizedBox(
            height: 350,
            width: 320,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Name : $name",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("cityTo : $cityTo"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("cityFrom : $cityFrom"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("phone : $phone"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("shipperAddress : $shipperAddress"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("address : $address"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("price : $price"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
