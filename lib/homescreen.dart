import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttergetx/controller/homecontroller.dart';
import 'package:fluttergetx/loginpage.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Notification"),
                  Switch(
                      value: _homeController.notification.value,
                      onChanged: (value) {
                        _homeController.setNotification(value);
                      })
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.red
                              .withOpacity(_homeController.opacity.value)),
                      Slider(
                          value: _homeController.opacity.value,
                          onChanged: (value) {
                            _homeController.setOpacity(value);
                          }),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(8),
                          itemCount: _homeController.foodList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  if (_homeController.emptyList.contains(
                                      _homeController.foodList[index]
                                          .toString())) {
                                    _homeController.removeFavList(
                                        _homeController.foodList[index]
                                            .toString());
                                  } else {
                                    _homeController.addFavList(_homeController
                                        .foodList[index]
                                        .toString());
                                  }
                                },
                                title: Text(
                                    _homeController.foodList[index].toString()),
                                trailing: Icon(
                                  Icons.favorite,
                                  color: _homeController.emptyList.contains(
                                          _homeController.foodList[index]
                                              .toString())
                                      ? Colors.white
                                      : Colors.red,
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                          radius: 50,
                          backgroundImage: _homeController.imagePath.isNotEmpty
                              ? FileImage(File(
                                  _homeController.imagePath.value,
                                ))
                              : null),
                      GestureDetector(
                        onTap: () {
                          _homeController.imagePick();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.brown.shade200,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: const Text("Pick Image in Gallery"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                 Get.to( LoginPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown.shade200,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Text("Login page"),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
