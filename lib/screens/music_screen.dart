import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertune/constants/app_constant.dart';
import 'package:fluttertune/helpers/custom_webview_screen.dart';
import 'package:fluttertune/helpers/ui_helper.dart';
import 'package:fluttertune/models/itune_resposne.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

class MusicScreen extends StatefulWidget {
  final int index;
  final List<Result> result;

  MusicScreen(this.index, this.result);

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  Animation _animation;
  AnimationController _animationController;
  double _seekVal;
  int _currenIndex;

  @override
  void initState() {
    super.initState();
    _seekVal = math.Random().nextDouble();
    _currenIndex = widget.index;
    _pageController = PageController(initialPage: widget.index);
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    _animationController.addListener(() {
      setState(() {});
    });
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  getGenreList() {
    return List.generate(
        widget.result[_currenIndex].genres.length,
        (i) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => CustomWebviewScreen(
                        widget.result[_currenIndex].genres[i].name,
                        widget.result[_currenIndex].genres[i].url)));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0),
                child: Chip(
                  label: MyShaderMask(
                    child: Text(
                      widget.result[_currenIndex].genres[i].name,
                      style: GoogleFonts.lato(fontSize: AppConstant.px12),
                    ),
                  ),
                  elevation: 2.0,
                  backgroundColor: AppConstant.BgColor,
                ),
              ),
            )).toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.BgColor,
        appBar: buildAppBar(),
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            _currenIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInCubic);
            setState(() {});
          },
          itemCount: widget.result.length,
          itemBuilder: (BuildContext context, int index) {
            return buildScaffoldBody(size);
          },
        ),
        bottomNavigationBar: buildContainer(size),
      ),
    );
  }

  Container buildScaffoldBody(Size size) {
    return Container(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(AppConstant.px16),
            width: size.width / 2 - 4,
            height: size.width / 2 - 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstant.px24),
              boxShadow: [
                BoxShadow(
                    blurRadius: 2,
                    offset: Offset(-2, -2),
                    color: AppConstant.PrimaryColor),
                BoxShadow(
                    blurRadius: 2,
                    offset: Offset(-2, 2),
                    color: AppConstant.SecondaryColor),
                BoxShadow(
                    blurRadius: 2,
                    offset: Offset(2, -2),
                    color: AppConstant.SecondaryColor),
                BoxShadow(
                  blurRadius: 2,
                  offset: Offset(2, 2),
                  color: AppConstant.AccentColor,
                )
              ],
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      widget.result[_currenIndex].artworkUrl100),
                  fit: BoxFit.cover),
            ),
          ),
          MyShaderMask(
            child: Text(
              widget.result[_currenIndex].name,
              style: GoogleFonts.lobster(
                  fontSize: AppConstant.px20, fontWeight: FontWeight.w100),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyShaderMask(
              child: Text(
                widget.result[_currenIndex].artistName,
                style: GoogleFonts.lato(fontSize: AppConstant.px16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.px24, vertical: AppConstant.px2),
            child: Wrap(
              children: getGenreList(),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstant.px20, vertical: AppConstant.px2),
            child: MyShaderMask(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppConstant.px24),
                    child: Row(
                      children: [
                        Text(
                          '${(6 * _seekVal).toStringAsFixed(2)}',
                          style: GoogleFonts.lato(fontSize: AppConstant.px12),
                        ),
                        Spacer(),
                        Text(
                          '6:00',
                          style: GoogleFonts.lato(fontSize: AppConstant.px12),
                        ),
                      ],
                    ),
                  ),
                  Slider(
                    value: _seekVal,
                    onChanged: (double value) {
                      _seekVal = value;
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildContainer(Size size) {
    return Container(
      width: size.width,
      height: 1.5 * kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {},
            heroTag: '1',
            backgroundColor: AppConstant.BgColor,
            child: MyShaderMask(child: Icon(Icons.fast_rewind)),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: '2',
            backgroundColor: AppConstant.BgColor,
            child: MyShaderMask(child: Icon(Icons.pause)),
          ),
          FloatingActionButton(
            onPressed: () {},
            heroTag: '3',
            backgroundColor: AppConstant.BgColor,
            child: MyShaderMask(child: Icon(Icons.fast_forward)),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: AppConstant.px0,
      leading: MyShaderMask(
        child: BackButton(),
      ),
      backgroundColor: AppConstant.BgColor,
      title: MyShaderMask(
          child: Text(
        "PLAYING NOW",
        style: GoogleFonts.lato(),
      )),
      centerTitle: true,
      actions: [
        Transform.rotate(
          angle: 2 * math.pi * _animation.value,
          alignment: FractionalOffset.center,
          child: MyShaderMask(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.music_note),
            ),
          ),
        )
      ],
    );
  }
}
