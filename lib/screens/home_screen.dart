import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertune/bloc/itune_bloc.dart';
import 'package:fluttertune/constants/app_constant.dart';
import 'package:fluttertune/helpers/ui_helper.dart';
import 'package:fluttertune/models/itune_resposne.dart';
import 'package:fluttertune/screens/music_screen.dart';
import 'package:fluttertune/services/itune_service.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItuneBloc _ituneBloc = ItuneBloc();

  //

  @override
  void initState() {
    super.initState();
    ItuneService(_ituneBloc).getItuneResponse();
  }

  @override
  void dispose() {
    _ituneBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: AppConstant.px0,
          backgroundColor: AppConstant.BgColor,
          leading: Padding(
            padding: const EdgeInsets.all(AppConstant.px12),
            child: MyShaderMask(
              child: Image.asset('assets/icon.png'),
            ),
          ),
          title: MyShaderMask(
            child: Text(
              AppConstant.AppName,
              style: GoogleFonts.lato(),
            ),
          ),
          centerTitle: true,
        ),
        body: buildScaffoldBody(),
      ),
    );
  }

  StreamBuilder<ItuneResponse> buildScaffoldBody() {
    return StreamBuilder<ItuneResponse>(
        stream: _ituneBloc.ituneStream,
        builder: (BuildContext context, AsyncSnapshot<ItuneResponse> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data.ituneModel.feed.results == null)
              return Center(
                child: Text("No data found"),
              );
            return ListView.builder(
              itemCount: snapshot.data.ituneModel.feed.results.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: AppConstant.px0,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => MusicScreen(
                              index, snapshot.data.ituneModel.feed.results)));
                    },
                    leading: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(snapshot
                          .data.ituneModel.feed.results[index].artworkUrl100),
                    ),
                    title: Text(
                      snapshot.data.ituneModel.feed.results[index].name,
                      style: TextStyle(color: AppConstant.DarkColor),
                    ),
                    subtitle: MyShaderMask(
                      child: Text(
                        snapshot.data.ituneModel.feed.results[index].artistName,
                        style: GoogleFonts.lato(),
                      ),
                    ),
                    trailing: Text(
                      snapshot.data.ituneModel.feed.results[index].releaseDate,
                      style: GoogleFonts.lato(),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: MyShaderMask(child: CircularProgressIndicator()),
            );
          }
        },
      );
  }
}
