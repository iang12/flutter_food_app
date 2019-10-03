import 'package:flutter/material.dart';
import 'package:food_app_flutter/animations/FadeAnimation.dart';
import 'package:food_app_flutter/pages/HomePage.dart';
import 'package:page_transition/page_transition.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  bool _textVisible = true;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });
    _animationController.forward().then((f) {
      Navigator.push(context,
          PageTransition(type: PageTransitionType.fade, child: HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ])),
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeAnimation(
                      .5,
                      Text('Food Custom Delivery',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      1.2,
                      Text('Veja Alguns Restaurantes Perto de Você',
                          style: TextStyle(
                            color: Colors.white,
                            height: 1.5,
                            fontSize: 18.0,
                          )),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    FadeAnimation(
                      1.2,
                      ScaleTransition(
                        scale: _animation,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.orange]),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 50),
                            opacity: _textVisible ? 1.0 : 0.0,
                            child: MaterialButton(
                              minWidth: double.infinity,
                              child: Text('Iniciar',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                _onTap();
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 50),
                      child: FadeAnimation(
                        1.4,
                        Align(
                          child: Text('Peça que iremos até você..',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            )));
  }
}
