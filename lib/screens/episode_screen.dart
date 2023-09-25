import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EpisodeScreen extends StatelessWidget {

    final String season;
    final String episode;
    final int idx;
    // ignore: use_key_in_widget_constructors
    const EpisodeScreen(
        {required this.season, required this.episode, required this.idx}
    );

    @override Widget build(BuildContext context) {
        final bbProvider = Provider.of<BbProvider>(context);
        final episodes = bbProvider.episodes;
        return
        Scaffold( backgroundColor : Colors.grey[350],
                        body : SafeArea(child : SingleChildScrollView(
                            keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.onDrag,
                            child : Column(children : [
                                const SizedBox(height : 20,),
                    Container(
                        alignment : Alignment.center,
                        child : Text('SEASON : $season', style : TextStyle(
                            fontFamily : 'MomsTypeWriter',
                            color : bbProvider.bbColor1,
                            fontSize : 35,
                            fontWeight : FontWeight.bold
                        )),
                    ),
                    const SizedBox(height : 10,),
                    Container(
                        alignment : Alignment.center,
                        child : Text('EPISODE : $episode', style : TextStyle(
                            fontFamily : 'MomsTypeWriter',
                            color : bbProvider.bbColor1,
                            fontSize : 25,
                            fontWeight : FontWeight.bold
                        )),
                    ),
                    const SizedBox(height : 15,),
                    Container(
                        alignment : Alignment.center,
                        child : Text('"${episodes[idx].title}"', style : TextStyle(
                            fontFamily : 'MomsTypeWriter',
                            color : bbProvider.bbColor1,
                            fontSize : episodes[idx].title.length > 22
                                ? 18
                                : 25,
                            fontWeight : FontWeight.bold
                        )),
                    ),
                    const SizedBox(height : 15,),
                    Container(
                        alignment : Alignment.center,
                        child : Text('Air Date - ${episodes[idx].airDate}', style : TextStyle(
                            fontFamily : 'MomsTypeWriter',
                            color : bbProvider.bbColor1,
                            fontSize : 18,
                            fontWeight : FontWeight.bold
                        )),
                    ),
                    const SizedBox(height : 5,),
                    Container(alignment : Alignment.center, child : Padding(
                            padding : const EdgeInsets.all(15.0),
                            child : Text('${episodes[idx].synopsis}', style : TextStyle(
                                fontFamily : 'MomsTypeWriter',
                                color : bbProvider.bbColor1,
                                fontSize : 20,
                                fontWeight : FontWeight.bold
                            )),
                        ),),
                        const SizedBox(height : 15,),
                        Container(
                            alignment : Alignment.center,
                            child : Text('Characters', style : TextStyle(
                                fontFamily : 'MomsTypeWriter',
                                color : bbProvider.bbColor1,
                                fontSize : 25,
                                fontWeight : FontWeight.bold
                            )),
                        ),
                        const SizedBox(height : 15,),
                        Column(
                                children : List.generate(episodes[idx].characters.length, (index) => Padding(
                                    padding : const EdgeInsets.all(2.0),
                                    child : Text('${episodes[idx].characters[index]}', style : TextStyle(
                                        fontFamily : 'MomsTypeWriter',
                                        color : bbProvider.bbColor1,
                                        fontSize : 20,
                                        fontWeight : FontWeight.bold
                                    )),
                                ))
                            ),
                            const SizedBox(height : 15,),
                            const BBArrow(),
                            const SizedBox(height : 15,)
                            ]),
                        ),)
                    );
                }
            }
