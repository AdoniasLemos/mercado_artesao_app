import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mercado_artesao/datas/product_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatefulWidget {
  @override
  HomeTabState createState() {
    return new HomeTabState(); // there is no need of new here, we are already using Dart 2.0 +
  }
}

class HomeTabState extends State<HomeTab> {
  int _current = 0;
  List<String> images = [
    'https://firebasestorage.googleapis.com/v0/b/mercadoartesao-1bdbb.appspot.com/o/IMG_2240.JPG?alt=media&token=3f4a2390-d393-4ed2-b218-e8d6cae0864b',
    'https://firebasestorage.googleapis.com/v0/b/mercadoartesao-1bdbb.appspot.com/o/IMG_1587.JPG?alt=media&token=5c882062-34a8-46c1-90a0-f68835d4478e',
    'https://firebasestorage.googleapis.com/v0/b/mercadoartesao-1bdbb.appspot.com/o/IMG_2523.JPG?alt=media&token=663eefdc-87bb-4053-89c1-38cbe44da152'
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          CarouselSlider(
            height: 480.0,
            initialPage: 0,
            onPageChanged: (index) {
              setState(() {
                _current = index;
              });
            },
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            items: images.map((imgUrl) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black38,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.fill,
                        ),
                      ));
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(
              images, (index, url){
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.lightBlue : Colors.blueGrey[100]
                  ),
                );
              }
            ),
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    ));
  }
}
