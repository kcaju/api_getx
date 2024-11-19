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
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "Home Screen",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder(
          builder: (Homecontroller controller) {
            return controller.isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Products :",
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
                                    crossAxisSpacing: 20,
                                    mainAxisExtent: 350,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Get.to(Detailscreen(
                                  name: controller.products?[index].name ?? "",
                                  image:
                                      "https://mansharcart.com/image/${controller.products?[index].thumb}",
                                  price:
                                      controller.products?[index].price ?? "",
                                  status:
                                      controller.products?[index].stockStatus ??
                                          "",
                                  description:
                                      controller.products?[index].description ??
                                          "",
                                ));
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Card(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          height: 300,
                                          width: double.infinity,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${controller.products?[index].name}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Card(
                                        child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: CachedNetworkImageProvider(
                                                      "https://mansharcart.com/image/${controller.products?[index].thumb}")),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15))),
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        right: 30,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 30,
                                          width: 100,
                                          child: Center(
                                            child: Text(
                                              " ${controller.products?[index].price}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.elliptical(60, 50),
                                                  bottomLeft:
                                                      Radius.circular(15),
                                                  topRight: Radius.circular(15),
                                                  bottomRight:
                                                      Radius.circular(15)),
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          },
        ));
  }
}
