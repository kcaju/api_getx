import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen(
      {super.key,
      required this.name,
      required this.image,
      required this.price,
      this.description,
      required this.status});
  final String name, image, price;
  final dynamic description;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detsil Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(image)),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15)),
              height: 400,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              price,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              status,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(description),
          ],
        ),
      ),
    );
  }
}
