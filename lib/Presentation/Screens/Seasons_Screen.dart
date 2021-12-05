import 'package:breaking_app/Data/Models/SeasonsScreenChoice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class seasonsScreen extends StatefulWidget {
  List<String> _season;

  seasonsScreen(this._season);

  @override
  _seasonsScreenState createState() => _seasonsScreenState(_season);
}

class _seasonsScreenState extends State<seasonsScreen> {
  late List <Season> _season;
  _seasonsScreenState(this.argument);
  List<String> argument;
  @override
  void initState() {
    if(argument[1] =="Breaking Bad")
    {
      _season=Breaking_Seasons;
    }
    else
    {
      _season=Better_Call_Seasons;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        //leading: Icon(Icons.desktop_windows),
        title: Text("Seasons"),
      ),
      body: GridView.builder(
        itemCount:_season.length ,
        itemBuilder: (BuildContext context, int index) {
         return InkWell(
           onTap: ()
           {
             Navigator.pushNamed(context, "Seasons_details",arguments: [argument[0],_season[index].num,_season[index].Trailerlink]);
           },
           child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                image: DecorationImage(
                  image: AssetImage(_season[index].img),
                      fit: BoxFit.cover
                )
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                      color:Colors.white,
                    borderRadius: BorderRadius.only(topRight:Radius.circular(11))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(_season[index].num,style: TextStyle(
                      color: Colors.black,
                      fontSize: 20
                    ),
                    ),
                  ),
                ) ,
              ),
            ),
         );
      },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
            childAspectRatio: 0.65
      ),),
    );
  }
}
