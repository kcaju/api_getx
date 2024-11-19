import 'package:api_getx/controller/homecontroller.dart';
import 'package:api_getx/view/detailscreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Homecontroller home = Get.put(Homecontroller());
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
        ),
        body: GetBuilder(
          builder: (Homecontroller controller) {
            return controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "Products",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        GridView.builder(
                          itemCount: controller.products?.length,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 250,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Get.to(Detailscreen(
                                name: controller.products?[index].name ?? "",
                                image:
                                    "https://mansharcart.com/image/${controller.products?[index].thumb}",
                                price: controller.products?[index].price ?? "",
                                status:
                                    controller.products?[index].stockStatus ??
                                        "",
                                description:
                                    controller.products?[index].description ??
                                        "",
                              ));
                            },
                            child: Container(
                              height: 200,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          "https://mansharcart.com/image/${controller.products?[index].thumb}")),
                                  color: Colors.green),
                              child: Column(
                                children: [
                                  Spacer(),
                                  Text(
                                    "${controller.products?[index].name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${controller.products?[index].price}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
          },
        ));
  }
}
