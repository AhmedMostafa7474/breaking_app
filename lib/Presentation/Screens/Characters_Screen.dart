import 'package:breaking_app/Business_Layer/charcaters_cubit.dart';
import 'package:breaking_app/Data/Models/Characters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class characters_screen extends StatefulWidget {
  String url;
  characters_screen(this.url);

  @override
  _characters_screenState createState() => _characters_screenState(url);
}

class _characters_screenState extends State<characters_screen> {
  String Url;
  late List<Character> AllCharacters;
   List<Character> searchedCharacters=[];
  bool isSearch = false;
  final searchtextController=TextEditingController();

  _characters_screenState(this.Url);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Load();
  }
  @override
  void dispose() {
    BlocProvider.of<CharcatersCubit>(context).close();
    super.dispose();
  }
  Load() async {
    print("Url "+Url);
    AllCharacters =await BlocProvider.of<CharcatersCubit>(context).GetAllCharacters(Url);
  }
  Widget searchField()
  {
    return TextField(
      controller: searchtextController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: "Find a Character"
        ,border: InputBorder.none,
      ),
      style: TextStyle(
        color: Colors.white ,fontSize: 18
      ),
      onChanged: (searchtext){
        setState(() {
          searchedCharacters=AllCharacters.where((character) => character.name.toLowerCase().startsWith(searchtext.toLowerCase())).toList();
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: isSearch?AppBar(
        title:searchField(),
        actions: [IconButton(icon: Icon(Icons.clear,color: Colors.white,size: 20),onPressed: (){
             setState(() {
               searchtextController.clear();
               searchedCharacters.clear();
               isSearch=false;
             });
      },)],
      ):
      AppBar(
        backgroundColor: Colors.black,
        title:  Text(
         "Characters",
          style: TextStyle(color: Colors.white),
        ),
          actions: [IconButton(icon: Icon(Icons.search,color: Colors.white,size: 20,),onPressed: (){
             setState(() {
               isSearch=true;
             });
          },)],
      ),
      body: BlocBuilder<CharcatersCubit, CharcatersState>(
          builder: (context, state) {
        if (state is CharcatersLoaded) {
          AllCharacters = (state).characters;
          return  GridView.builder(
                    shrinkWrap: true,
                      itemCount:searchedCharacters.isNotEmpty?searchedCharacters.length: AllCharacters.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                          crossAxisSpacing: 0.7,
                          mainAxisSpacing: 0.4),
                      itemBuilder: (BuildContext context,int index) {
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, "Char_details",arguments:searchedCharacters.isNotEmpty?searchedCharacters[index]:AllCharacters[index] );
                          },
                          child: GridTile(
                            child: Hero(
                              tag: searchedCharacters.isNotEmpty?searchedCharacters[index].charId:AllCharacters[index].charId,
                              child: Container(
                                height: 400,
                                width: 180,
                                //margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    ),
                                child: Image.network(searchedCharacters.isNotEmpty?searchedCharacters[index].img:AllCharacters[index].img,
                                    fit: BoxFit.cover, loadingBuilder:
                                        (BuildContext context, Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                  if(loadingProgress==null)return child;
                                  return Center(
                                      child: SpinKitCircle(
                                    color: Colors.yellow,
                                    size: 25.0,
                                  ));
                                }),
                              ),
                            ),
                            footer: Container(
                              padding: EdgeInsets.symmetric(horizontal: 15,vertical:10 ),
                              color: Colors.black54,
                              child: Text(searchedCharacters.isNotEmpty?searchedCharacters[index].name:AllCharacters[index].name,style: TextStyle(
                                height: 1.3,
                                    fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,),

                            ),
                          ),
                        );
                      },
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
