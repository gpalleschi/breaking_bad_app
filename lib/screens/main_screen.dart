import 'package:animate_do/animate_do.dart';
import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/screens/character_screen.dart';
import 'package:breaking_bad/widgets/death_card.dart';
import 'package:breaking_bad/widgets/quote_card.dart';
import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import 'package:expandable/expandable.dart';
import 'dart:math' as math;

class MainScreen extends StatelessWidget {
   
  const MainScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final bbProvider = Provider.of<BbProvider>(context);

    final characters = bbProvider.characters;
    final quotes = bbProvider.quotes;
    final episodes = bbProvider.episodes;

    final List<Widget> items = [];

    if ( bbProvider.menuSelected == 'Characters' ) {
        for (int idx=0; idx<characters.length;idx++) {
          items.add(FadeIn(child: GestureDetector(
            onTap: () { Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CharacterScreen(idxCharacter: idx,)));},
            child: CharacterCard(imgPath: characters[idx].imageUrl, characterName: characters[idx].name))));
        } 
    } else {
        if ( bbProvider.menuSelected == 'Quotes' ) {
           for (int idx=0; idx<quotes.length;idx++) {
               items.add(FadeIn(child: QuoteCard(text: quotes[idx].quote, author: quotes[idx].author)));
           } 
        } else 
        if ( bbProvider.menuSelected == 'Deaths') {
           bbProvider.setItesDeaths();
        } else {
           // Episodes
           int idx=0;
           String prevSeason = 'XXX';
           for (idx=0; idx<episodes.length;idx++) {
            if ( prevSeason != episodes[idx].season.toString().trim() ) {
                prevSeason = episodes[idx].season.toString().trim();           
                items.add( ExpandablePanel(
                  theme: ExpandableThemeData(iconColor: Color(0xff154F3C), iconSize: 30),
                  header:  Row(children: [Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Season ${episodes[idx].season}', style: TextStyle(color: Color(0xff154F3C), fontWeight: FontWeight.bold, fontSize: 25, fontFamily: 'Cooper')),
                )],), 
                expanded: Column(children: List.generate(episodes.length, (index) {
                  if ( episodes[index].season.toString().trim() == prevSeason ) {
                     return Padding(
                       padding: const EdgeInsets.only(bottom: 12.0),
                       child: Row(children: [SizedBox(width: 20,), Text('Episode ${episodes[index].episode} : ${episodes[index].title}', style: TextStyle(color: Color(0xff154F3C), fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Cooper'))],),

                     ); 
                  } else {
                     return Container();
                  }
                  })),
                collapsed: Container(), ) );
            }
            //items.add(BBEpisode(episodes[idx].episode, episodes[idx].title, episodes[idx].season, episodes[idx].airDate, episodes[idx].characters));
           }
        }
    }

    final heightSliver = MediaQuery.of(context).size.height*0.27;


    return Scaffold(
      body: SafeArea(
        child: bbProvider.menuSelected == 'Deaths' ?
          Column(children: [SliderHeader(heightSliver: heightSliver),
          Flexible(
            child: Stack(
              children: [
                Positioned(top:30, left: 40, child: Transform.rotate(angle: 0.35,
                child: Image.asset('assets/gunn.png', width: MediaQuery.of(context).size.width*0.5))),
                Positioned(top:40, right:90, child: Transform.rotate(angle: math.pi/2.9,child: Image.asset('assets/cartridge.png', width: MediaQuery.of(context).size.width*0.15))),
                Positioned(top:80, right:30, child: Transform.rotate(angle: -.40,child: Image.asset('assets/cartridge.png', width: MediaQuery.of(context).size.width*0.15))),
                Positioned(bottom:50, left:100, child: Transform.rotate(angle: .83,child: Image.asset('assets/cartridge.png', width: MediaQuery.of(context).size.width*0.15))),
                Positioned(bottom:30, right:30, child: Transform.rotate(angle: -math.pi/1.2,child: Image.asset('assets/cartridge.png', width: MediaQuery.of(context).size.width*0.15))),
                Positioned(bottom:40, left:20, child: Transform.rotate(angle: -math.pi/1,child: Image.asset('assets/cartridge.png', width: MediaQuery.of(context).size.width*0.15))),
                Positioned(bottom:60, left:MediaQuery.of(context).size.width/2, child: Transform.rotate(angle: math.pi/1.9,child: Image.asset('assets/cartridge.png', width: MediaQuery.of(context).size.width*0.15))),
                CardSwiper(
                  cardsCount: bbProvider.itemsDeaths.length,
                  numberOfCardsDisplayed: bbProvider.itemsDeaths.length > 2 ? 3 : (bbProvider.itemsDeaths.length == 2 ? 2 : 1) ,
                  backCardOffset: const Offset(0, 25),
                  cardBuilder: (context, index, percentThresholdX, percentThresholdY) => bbProvider.itemsDeaths[index],
                ),
              ],
            ),
          ),
          ],)
        :
        CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(child: Container( alignment: Alignment.centerLeft, color: Colors.white, child: SliderHeader(heightSliver: heightSliver,)), maxheigth: heightSliver, minheigth: heightSliver)
        ),
        SliverList(delegate: SliverChildListDelegate([...items, const SizedBox(height: 100,)])) 
      ],
    ) 
      )
    );
  }
}

// Creiamo il nostro Header customizado
class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {

  final double minheigth;
  final double maxheigth;
  final Widget child;

  _SliverCustomHeaderDelegate({required this.minheigth, required this.maxheigth, required this.child});


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    // costruisce il nostro childin un SizedBox.expand
    return SizedBox.expand(child: child);
  }

  @override
  // indica la dimensione massima in cui si estende
  // Utilizzo il maggiore tra min e max heigth
  double get maxExtent => maxheigth > minheigth ? maxheigth : minheigth;

  @override
  // TODO: implement minExtent
  double get minExtent => minheigth < maxheigth ? minheigth : maxheigth;

  @override
  // Lo ridisegno se è cambiato qualcosa
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxheigth != oldDelegate.maxExtent ||
           minheigth != oldDelegate.minExtent ||
           child != oldDelegate.child;
  }
  
}