import 'package:animate_do/animate_do.dart';
import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/screens/character_screen.dart';
import 'package:breaking_bad/widgets/death_card.dart';
import 'package:breaking_bad/widgets/quote_card.dart';
import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
   
  const MainScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final bbProvider = Provider.of<BbProvider>(context);

    final characters = bbProvider.characters;
    final quotes = bbProvider.quotes;
    final deaths = bbProvider.deaths;

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
           for (int idx=0; idx<deaths.length;idx++) {
               String deathValue = deaths[idx].death;
               if ( deaths[idx].death.length > 60 ) {
                  deathValue = deaths[idx].death.substring(0,60) + '...';
               }
               items.add(BounceInLeft(child: DeathCard(death: deathValue, idxDeath: idx,)));
           }

        } else {
           items.add(Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(children : [
                 DeathCard(death: 'Pippo', idxDeath: 1,), ]
               ),
             )
           );
        }
    }

    final heightSliver = MediaQuery.of(context).size.height*0.27;


    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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