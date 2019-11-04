import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:mercado_artesao/models/user_model.dart';
import 'package:mercado_artesao/screens/login_screen.dart';
import 'package:mercado_artesao/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  bool showSellers = false;
  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 170.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text("Mercado\nArtesão",
                        style: TextStyle(fontSize: 34.0, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: ScopedModelDescendant<UserModel>(
                          builder: (context, child, model){
                            if(model.userData["role"] && model.userData["role"]=="seller"){
                              showSellers = true;
                            }
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    !model.isLoggedIn() ?
                                    "Entre ou cadastre-se >"
                                        : "Sair",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  onTap: (){
                                    if(!model.isLoggedIn())
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context)=>LoginScreen())
                                      );
                                    else
                                      model.signOut();
                                  },
                                )
                              ],
                            );
                          },
                        )
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", pageController, 0, true),
              Divider(),
              DrawerTile(Icons.list, "Categorias", pageController, 1, true),
              Divider(),
              DrawerTile(Icons.store, "Minhas Vendas", pageController, 2, showSellers),
              Divider(),
              DrawerTile(Icons.shopping_basket, "Meus Pedidos", pageController, 3, true),
            ],
          )
        ],
      ),
    );
  }
}
