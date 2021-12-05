import 'package:breaking_app/Data/Models/Characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class charactersDetails extends StatefulWidget {
  final character;
  charactersDetails(this.character);

  @override
  _charactersDetailsState createState() => _charactersDetailsState(character);
}

class _charactersDetailsState extends State<charactersDetails> {
  Character character;
  _charactersDetailsState(this.character);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 600,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                character.nickname
                    ,style: TextStyle(color:Colors.white ),
              ),
              background: Hero(
                tag: character.charId,
                child: Image.network(character.img,fit: BoxFit.cover,),
              ),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
              Container(
                padding: EdgeInsets.all(12.0),
                color: Colors.grey[900],
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Name : ",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                        Text(character.portrayed,style: TextStyle(color:Colors.white70,
                            fontSize: 15),),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      children: [
                        Text("Birthday : ",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                        Text(character.birthday,style:TextStyle(color: Colors.white70,
                            fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text("occupation : ",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                            character.occupation.map((e) => Text(e.toString(),style:TextStyle(color:Colors.white70,
                              fontSize: 15,),maxLines: 2)).toList(),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Text("Seasons appearance : ",style:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold)),
                        Column(
                          children:
                            character.appearance.map((e) => Text("Season "+e.toString(),style:TextStyle(color: Colors.white70,
                                fontSize: 15))).toList(),
                        ),
                      ],
                    )

                  ],
                ) ,
              ),
              Container(color:Colors.grey[800],height: 250)
          ],))
        ],
      ) ,
    );
  }
}
