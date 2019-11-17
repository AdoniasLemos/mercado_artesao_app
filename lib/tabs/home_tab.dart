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

  List<String> images;
  List<ProductData> product;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.lightBlue,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Mercado Artesão"),
              ),
            ),
          ],
        )
      ],
    );
  }
}
