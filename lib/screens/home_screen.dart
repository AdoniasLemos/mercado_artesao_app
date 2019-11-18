import 'package:flutter/material.dart';
import 'package:mercado_artesao/tabs/home_tab.dart';
import 'package:mercado_artesao/widgets/custom_drawer.dart';
import 'package:mercado_artesao/tabs/orders_tab.dart';
import 'package:mercado_artesao/tabs/seller_tab.dart';
import 'package:mercado_artesao/tabs/products_tab.dart';
import 'package:mercado_artesao/widgets/cart_button.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: const Text("Mercado Artesão"),
            centerTitle: true,
          ),
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Categorias"),
            backgroundColor: Colors.lightBlue,
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ProductsTab(),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.blueAccent[700],
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text('Não há nenhuma notificações'),
                  ));
                },
              )
            ],
            title: Text(
              'Minhas Vendas',
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: PlacesTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lightBlue,
            title: Text("Meus Pedidos"),
            centerTitle: true,
          ),
          body: OrdersTab(),
          drawer: CustomDrawer(_pageController),
        )
      ],
    );
  }
}
