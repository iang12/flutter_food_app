import 'package:flutter/material.dart';
import 'package:food_app_flutter/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        brightness: Brightness.light,
        leading: Icon(null),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        'Food Custom PHB',
                        style: TextStyle(
                            color: Colors.grey[80],
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 50.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FadeAnimation(
                            1, makeCategory(isActive: true, title: 'Pizza')),
                        FadeAnimation(1,
                            makeCategory(isActive: false, title: 'Amburguer')),
                        FadeAnimation(
                            1, makeCategory(isActive: false, title: 'Açai')),
                        FadeAnimation(
                            1, makeCategory(isActive: false, title: 'Saladas')),
                        FadeAnimation(
                            1, makeCategory(isActive: false, title: 'Bebidas')),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
            FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Entrega Grátis',
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    FadeAnimation(
                        1.4,
                        makeItem(
                          image:
                              'https://images.unsplash.com/photo-1557686413-2f7e2277bfa9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
                        )),
                    FadeAnimation(
                        1.5,
                        makeItem(
                          image:
                              'https://images.unsplash.com/photo-1559608568-99cb288ccebe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                        )),
                    FadeAnimation(
                        1.6,
                        makeItem(
                          image:
                              'https://images.unsplash.com/photo-1545016803-a7e357a737e4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                        )),
                    FadeAnimation(
                        1.7,
                        makeItem(
                          image:
                              'https://images.unsplash.com/photo-1549118060-fd6cb65d5a15?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }

  Widget makeCategory({bool isActive, String title}) {
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[700] : Colors.white,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Align(
          child: Text(
            title,
            style: TextStyle(
                color: isActive ? Colors.white : Colors.grey[500],
                fontWeight: isActive ? FontWeight.bold : FontWeight.w100,
                fontSize: 18.0),
          ),
        ),
      ),
    );
  }

  Widget makeItem({String image}) {
    return AspectRatio(
      aspectRatio: 1 / 1.4,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(begin: Alignment.bottomCenter, stops: [
                  .2,
                  .9
                ], colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ])),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.favorite, color: Colors.white)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("R\$ 15.00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text("Pizza",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
