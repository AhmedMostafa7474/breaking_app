import 'package:breaking_app/Data/Models/Series.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class series_screen extends StatefulWidget {
  @override
  _series_screenState createState() => _series_screenState();
}

class _series_screenState extends State<series_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.desktop_windows),
        title: Text("Series"),
      ),
      body: ListView.builder(
            itemCount: Series.length,
            itemBuilder: (BuildContext context, int index) {
             return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, "Home",arguments: Series[index]);
                  },
                  child: Hero(
                    tag: Series[index].Name,
                    child: Container(
                      height:MediaQuery.of(context).size.height/4,
                      width:MediaQuery.of(context).size.width,
                      decoration:BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(11.0),
                        image: DecorationImage(
                          image: AssetImage(Series[index].img),
                          fit: BoxFit.cover
                        )
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                          child: Text(Series[index].Name,style: TextStyle(
                            fontSize: 30,
                                color: Colors.white
                          ),)),
                    )
                  ),
                );
          },
      ),
    );
  }
}
