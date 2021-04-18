import 'package:demo_app/controllers/c_home.dart';
import 'package:demo_app/model/cars_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, CHome cHome, Widget child) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Cars"),
        ),
        body: Container(
          child: cHome.isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      list(cHome),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
        ),
      );
    });
  }

  carItem(BuildContext context, CarsModel carsList) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Row(
                  children: [
                    FadeInImage.assetNetwork(
                      image: carsList.image == null
                          ? ""
                          : "https://afterpay-mobile-interview.s3.amazonaws.com/" +
                              carsList.image,
                      width: 100,
                      height: 70,
                      placeholder: 'images/placeholder.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${carsList.year} ${carsList.make.manufacturer} ${carsList.make.model}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("\$ ${carsList.price}"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }

  list(CHome cHome) {
    if (cHome.carsList == null) {
      return Center(child: Text("Something went wrong :("));
    } else if (cHome.carsList.length == 0) {
      return Center(child: Text("No cars available :("));
    } else {
      return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: cHome.carsList.length,
        physics: ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) =>
            carItem(context, cHome.carsList[index]),
      );
    }
  }
}
