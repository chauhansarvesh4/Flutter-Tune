import 'package:flutter/material.dart';
import 'package:fluttertune/bloc/itune_bloc.dart';
import 'package:fluttertune/constants/app_constant.dart';
import 'package:fluttertune/helpers/ui_helper.dart';
import 'package:fluttertune/screens/home_screen.dart';
import 'package:fluttertune/services/itune_service.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.elasticOut)
          ..addListener(() {
            if (_animationController.isCompleted) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) {
                return HomeScreen();
              }));
            }
            setState(() {});
          });

    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget child) {
            return Column(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: MyShaderMask(
                            child: Image.asset(
                          'assets/icon.png',
                          width: 200,
                        )),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: MyShaderMask(
                          child: Text(
                            AppConstant.AppName,
                            style: GoogleFonts.novaSquare(
                              textStyle: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
