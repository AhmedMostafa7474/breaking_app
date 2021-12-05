import 'package:breaking_app/Data/APIsLink.dart';

class choice
{
  String title;
  String routename;
  String link;

  choice(this.title, this.routename, this.link);
}
List<choice> choices=[
  choice("Seasons", "Seasons", episodelink),
  choice("Characters", "Chars",charaterslink) ,
  choice("Quotes", "", quoteslink)
];