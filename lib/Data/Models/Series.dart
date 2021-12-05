import 'package:breaking_app/Data/APIsLink.dart';

class series
{
  String Name;
  List<String> link;
  String img;

  series(this.Name, this.link, this.img);
}

List<series>Series=[
  series("Breaking Bad", [Breakinglink2,Breakinglink,Breakinglink], "assets/Breaking.jpg"),
  series("Better Call Saul", [Betterlink2,Betterlink,Betterlink], "assets/Better.jpeg"),
];