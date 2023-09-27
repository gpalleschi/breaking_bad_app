import 'package:animate_do/animate_do.dart';
import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/screens/screens.dart';
import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

class MainScreen extends StatelessWidget {

    const MainScreen({
        Key
            ? key
    }): super(key
    : key);

    @override Widget build(BuildContext context) {
        final bbProvider = Provider.of<BbProvider>(context);

        final characters = bbProvider.characters;
        final quotes = bbProvider.quotes;
        final episodes = bbProvider.episodes;

        final List<Widget> items = [];

        if (bbProvider.menuSelected == 'Characters') {
            for (int idx = 0; idx < characters.length; idx++) {
                items.add(FadeIn(child
                : GestureDetector(onTap
                : () {
                    Navigator.push(context, MaterialPageRoute(builder
                    : (BuildContext context) => CharacterScreen(idxCharacter
                    : idx,)));
                }, child
                : CharacterCard(imgPath
                : characters[idx].imageUrl, characterName
                : characters[idx].name))));
            }
        } else {
            if (bbProvider.menuSelected == 'Quotes') {
                for (int idx = 0; idx < quotes.length; idx++) {
                    items.add(FadeIn(child
                    : QuoteCard(text
                    : quotes[idx].quote, author
                    : quotes[idx].author)));
                }
            } else if (bbProvider.menuSelected == 'Deaths') {
                bbProvider.setItesDeaths();
            } else {
                // Episodes
                int idx = 0;
                String prevSeason = 'XXX';
                for (idx = 0; idx < episodes.length; idx++) {
                    if (prevSeason != episodes[idx].season.toString().trim()) {
                        prevSeason = episodes[idx]
                            .season
                            .toString()
                            .trim();
                        items.add(Padding(padding
                        : const EdgeInsets.only(left
                            : 8.0, top
                            : 10, bottom
                            : 5), child
                            : ExpandablePanel(theme
                            : ExpandableThemeData(iconColor
                                : bbProvider.bbColor2, iconSize
                                : 30), header
                                : Row(children
                                : [Image.asset('assets/images/${bbProvider.iconSeason[int.parse(episodes[idx].season.toString().trim())-1]}', scale: 2, color: bbProvider.bbColor2),
                                  Text('Season ${episodes[idx].season}', style
                                    : TextStyle(color
                                    : bbProvider.bbColor2, fontWeight
                                    : FontWeight.bold, fontSize
                                    : 25, fontFamily
                                    : 'Cooper')), ],), expanded
                                : Column(children
                                : List.generate(episodes.length, (index) {
                                    if(episodes[index].season.toString().trim() == prevSeason) {
                                        return Padding(padding
                                        : const EdgeInsets.only(bottom
                                            : 12.0), child
                                            : GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder
                                                          : (BuildContext context) => EpisodeScreen(season
                                                          : episodes[index].season, episode
                                                          : episodes[index].episode, idx
                                                          : index)));
                                              },
                                              child: Row(children : [ const SizedBox(width : 20,),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                    Text('${episodes[index].episodeId}', style : TextStyle(color : bbProvider.bbColor2, fontWeight : FontWeight.bold, fontSize : 18, fontFamily : 'Cooper')),
                                                    const SizedBox(height: 3,),
                                                    Text('"${episodes[index].title}"', style : TextStyle(color : bbProvider.bbColor2, fontWeight : FontWeight.bold, fontSize : 18, fontFamily : 'Cooper'))
                                                  ],),
                                                  const Spacer(),
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 8.0),
                                                    child: Icon(Icons.info, color
                                                        : bbProvider.bbColor2,size: 30,),
                                                  ),
                                                  ],),
                                            ),);
                                            } else {
                                                return Container();
                                            }
                                        })), 
                                        collapsed
                                        : Row(
                                          children: [
                                            const SizedBox(width : 70,),
                                            Text('${bbProvider.seasonEpisodes[int.parse(episodes[idx].season.toString().trim())-1]} Episodes', style : TextStyle(color : bbProvider.bbColor2, fontWeight : FontWeight.bold, fontSize : 18, fontFamily : 'Cooper')),
                                          ],
                                        ),),));
                                    }
                                }
                            }
                        }

                        final heightSliver = MediaQuery.of(context).size.height * 0.27;

                        return Scaffold(body
                        : SafeArea(
                            child : bbProvider.menuSelected == 'Deaths' ? 
                                 Column(
                                         children : [
                                             SliderHeader(heightSliver : heightSliver),

 Flexible(
   child: CardSwiper( allowedSwipeDirection: AllowedSwipeDirection.only(left: true, right: true),
                                                            cardsCount
                                                            : bbProvider.itemsDeaths.length,
                                                            numberOfCardsDisplayed
                                                            : bbProvider.itemsDeaths.length > 2
                                                            ? 3
                                                            : (
                                                                bbProvider.itemsDeaths.length == 2
                                                                    ? 2
                                                                    : 1
                                                            ),
                                                            backCardOffset
                                                        : const Offset(0, 25),
                                                            cardBuilder
                                                            : (context, index, percentThresholdX, percentThresholdY) => bbProvider.itemsDeaths[index],
                                                        ),
 ),
                                              Transform.rotate(angle: 0.25,
                                              child: Image.asset('assets/images/gunn.png', width : MediaQuery.of(context).size.width * 0.7)),
                                         ],
                                    )
                                    : CustomScrollView(slivers
                                    : [
                                        SliverPersistentHeader(floating
                                        : true, delegate
                                        : _SliverCustomHeaderDelegate(child
                                        : Container(alignment
                                        : Alignment.centerLeft, color
                                        : Colors.white, child
                                        : SliderHeader(heightSliver
                                        : heightSliver,)), maxheigth
                                        : heightSliver, minheigth
                                        : heightSliver)),
                                        SliverList(delegate
                                        : SliverChildListDelegate([
                                            ...items,
                                            const SizedBox(height
                                            : 100,)
                                        ]))
                                    ],)
                        ));
                        }
                    }

                    // Creiamo il nostro Header customizado
                    class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

                        final double minheigth;
                        final double maxheigth;
                        final Widget child;

                        _SliverCustomHeaderDelegate(
                            {required this.minheigth, required this.maxheigth, required this.child}
                        );

                        @override Widget build(
                            BuildContext context,
                            double shrinkOffset,
                            bool overlapsContent
                        ) {

                            // costruisce il nostro childin un SizedBox.expand
                            return SizedBox.expand(child
                            : child);
                        }

                        @override
                        // indica la dimensione massima in cui si estende Utilizzo il maggiore tra min e
                        // max heigth
                        double get maxExtent => maxheigth > minheigth
                            ? maxheigth
                            : minheigth;

                        @override
                        double get minExtent => minheigth < maxheigth
                            ? minheigth
                            : maxheigth;

                        @override
                        // Lo ridisegno se è cambiato qualcosa
                        bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
                            return maxheigth != oldDelegate.maxExtent || minheigth != oldDelegate.minExtent || child != oldDelegate.child;
                        }

                    }