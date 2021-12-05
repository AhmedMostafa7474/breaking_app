class Season
{
  String num;
  String img;
  String Trailerlink;
  Season(this.num, this.img,this.Trailerlink);
}
List<Season>Breaking_Seasons=List.generate(5, (index) => Season("Season"+(index+1).toString(),
    "assets/breaking_season1.jpg".replaceAll(RegExp(r'\d'), (index+1).toString()),Breakinglinks[index]));
List<Season>Better_Call_Seasons=List.generate(5, (index) => Season("Season"+(index+1).toString(),
    "assets/Better_season1.jpg".replaceAll(RegExp(r'\d'), (index+1).toString()),Betterlinks[index]));

List<String> Breakinglinks=["HhesaQXLuRY", "I-8914DuyhY","ZK2IQ3LbLYk"
,"A1hk9q2iCWo"
,"3oFofYisAko"
];
List<String> Betterlinks=["HN4oydykJFc", "I9i5hpVeAR0","G90UBKrkdVo"
  ,"CW3C9YWoPBs"
  ,"quC2GkURViU"
];

//HN4oydykJFc
//I9i5hpVeAR0
//G90UBKrkdVo
//CW3C9YWoPBs
//quC2GkURViU