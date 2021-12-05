import 'dart:developer';

import 'package:breaking_app/Business_Layer/episode_cubit.dart';
import 'package:breaking_app/Data/Models/Episode.dart';
import 'package:breaking_app/Presentation/Widgets/GetxState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class season_details extends StatefulWidget {
  List<String> argument;

  season_details(this.argument);

  @override
  _season_detailsState createState() => _season_detailsState(argument);
}

class _season_detailsState extends State<season_details> {
  List<Episode> _episodes = [];
  List<String> argument;
  late YoutubePlayerController _ytbPlayerController;
  listMang controller=Get.put(listMang());
  _season_detailsState(this.argument);

  @override
  void dispose() {
    BlocProvider.of<EpisodeCubit>(context).close();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        _ytbPlayerController = YoutubePlayerController(
          initialVideoId: argument[2],
          params: YoutubePlayerParams(
            showFullscreenButton: true,
            autoPlay: false,
          ),
        );
      });
    });

  }
  Load() async {
    print("Url " + argument[0]);
    await BlocProvider.of<EpisodeCubit>(context).GetAllEpisodes(argument[0]);
  }

  bool flag=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(argument[1]),
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<EpisodeCubit, EpisodeState>(
          builder: (context, state) {
        if (state is EpisodesLoaded) {
          _episodes.clear();
          for (Episode e in (state).episodes) {
            if ("Season"+e.season.toString() == argument[1]) {
              _episodes.add(e);
            }
          }
         controller.descTextShowFlag = List.filled(_episodes.length, true).obs;
          return Column(
            children: [
              InkWell(
                onTap: () {
                  final _newCode = 'HhesaQXLuRY';
                  _ytbPlayerController.load(_newCode);
                  _ytbPlayerController.stop();
                },
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: _ytbPlayerController != null
                      ? YoutubePlayerIFrame(controller: _ytbPlayerController)
                      : Center(child: CircularProgressIndicator()),
                ),
              ),
              Expanded(
                  child:  ListView.builder(
                itemCount: _episodes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Obx(()=> InkWell(
                    onTap: () {
                        controller.change(index);
                        print(controller.descTextShowFlag[index]);
                    },
                    child:  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(11)),
                      height:controller.descTextShowFlag[index]?80: 150,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Episode " +
                                          _episodes[index].episode.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    SizedBox(height:5.0 ),
                                    Text(_episodes[index].title,style: TextStyle(
                                    color:Colors.white70,
                                      fontSize: 15
                                    ),),
                                   SizedBox(height: 5.0),
                                   !controller.descTextShowFlag[index]?
                                   Container(
                                      width: MediaQuery.of(context).size.width-90,
                                     child: Padding(
                                       padding: const EdgeInsets.only(left: 8.0),
                                       child: Text(_episodes[index].Description,style: TextStyle(
                                            color:Colors.white70,
                                            fontSize: 15,
                                        ),maxLines: 4,),
                                     ),
                                   ):SizedBox(height: 0.0,)
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(_episodes[index].rate,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    )),
                                Icon(
                                  Icons.star,
                                  color: Color(0xFFf5c518),
                                  size: 18,
                                ),
                                Icon(
                                  controller.descTextShowFlag[index]
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  color: Colors.blue,
                                )
                              ],
                            ),

                          ],
                        ),
                      ),
                    )),
                  );
                },
              ))
            ],
          );
        } else {
          return Center(
            child: SpinKitCircle(
              color: Colors.yellow,
              size: 100.0,
            ),
          );
        }
      }),
    );
  }
}
