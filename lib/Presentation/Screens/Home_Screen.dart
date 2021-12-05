import 'package:breaking_app/Data/Models/HomeScreenChoice.dart';
import 'package:breaking_app/Data/Models/Series.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home_screen extends StatefulWidget {
  series _series;
  home_screen(this._series);


  @override
  _home_screenState createState() => _home_screenState(_series);
}

class _home_screenState extends State<home_screen> {
    series _series;

  _home_screenState(this._series);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
        SliverAppBar(
        expandedHeight: 400,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            _series.Name
            ,style: TextStyle(color:Colors.white ),
          ),
          background: Hero(
            tag: _series.Name,
            child: Image.asset(_series.img,fit: BoxFit.cover,),
          ),
        ),
      ),
          SliverFixedExtentList(
            itemExtent: 80,
            delegate:SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                 return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, choices[index].routename,arguments:[choices[index].link+_series.link[index],_series.Name]);
                    },
                    child: ListTile(
                      title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              choices[index].title
                                  ,style: TextStyle(
                            fontWeight: FontWeight.w600
                                ,fontSize: 22
                          ),
                          ),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                  );
          },
              childCount:choices.length,
            )
          )
        ]
    )
    );
  }
}
