// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad/models/models.dart';
import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:filter_list/filter_list.dart';

class SliderHeader extends StatelessWidget {
  final double heightSliver;
  const SliderHeader({
    required this.heightSliver,
  });

  @override
  Widget build(BuildContext context) {

    // final size = MediaQuery.of(context).size;
    final Color bbColor1 = Color(0xff0E5334);
    final Color bbColor2 = Color(0xff154F3C);
    final Color bbColor3 = Color(0xff078F3D);
    final Color bbColor4 = Color.fromARGB(255, 32, 206, 101);

    // final bbProvider = Provider.of<BbProvider>(context,listen: false);

    return Material(
      elevation: 10,
      //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
      child: Container(
        height: heightSliver,
        decoration: BoxDecoration(//color: Colors.green.shade100, 
        gradient: LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.topRight,
                                    colors: [bbColor3, bbColor2
                            ]),
                                  //borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
                                  border: Border(bottom: BorderSide(color: Colors.black, width: 2.0,),),
        ),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              _MenuTitleLogo(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(height: 1, width: double.infinity, color: Colors.black),
              ),
              _ListMenuItems(),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitleLogo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bbProvider = Provider.of<BbProvider>(context);
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/breaking-bad-logo.png', width: size.height*0.14),
        Text(bbProvider.menuSelected, style: TextStyle(color: Color(0xff154F3C), fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Cooper'),),
        _SearchButton(),
    ],);
  }
}

class _SearchButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bbProvider = Provider.of<BbProvider>(context, listen: false);
    return IconButton(onPressed: () 
    async {
              final Color bbColor1 = Color(0xff0E5334);
              final Color bbColor2 = Color(0xff154F3C);
              final Color bbColor3 = Color(0xff078F3D);
              final Color bbColor4 = Color.fromARGB(255, 32, 206, 101);
              if ( bbProvider.menuSelected == 'Characters') {
                  await FilterListDialog.display<CharactersBb>(
                    context,
                    height: double.infinity,
                    themeData: _FilterListThemeData(context, bbColor3, bbColor2),
                    listData: bbProvider.charactersToSel,
                    selectedListData: bbProvider.characters,
                    choiceChipLabel: (character) => character!.name,
                    validateSelectedItem: (list, val) => list!.contains(val),
                    onItemSearch: (character, query) {
                      return character.name!.toLowerCase().contains(query.toLowerCase());
                    },
                    onApplyButtonClick: (list) {
                      // print('Selected : ${list!.length}');
                      bbProvider.characters = list!;
                      Navigator.pop(context);
                    },
                  );
              } else if ( bbProvider.menuSelected == 'Deaths') {
                  await FilterListDialog.display<DeathsBb>(
                    context,
                    height: double.infinity,
                    themeData: _FilterListThemeData(context, bbColor3, bbColor2),
                    listData: bbProvider.deathsToSel,
                    selectedListData: bbProvider.deaths,
                    choiceChipLabel: (death) {
                      return death!.death;
                    },
                    validateSelectedItem: (list, val) => list!.contains(val),
                    onItemSearch: (death, query) {
                      return death.death!.toLowerCase().contains(query.toLowerCase());
                    },
                    onApplyButtonClick: (list) {
                      print('Deaths Selected : ${list!.length}');
                      bbProvider.deaths = list!;
                      Navigator.pop(context);
                    },
                  );

              } else if ( bbProvider.menuSelected == 'Quotes') {
                  await FilterListDialog.display<QuotesBb>(
                    context,
                    height: double.infinity,
                    themeData: _FilterListThemeData(context, bbColor3, bbColor2),
                    listData: bbProvider.quotesUToSel,
                    selectedListData: bbProvider.quotesU,
                    choiceChipLabel: (quote) => quote!.author,
                    validateSelectedItem: (list, val) => list!.contains(val),
                    onItemSearch: (quote, query) {
                      return quote.author!.toLowerCase().contains(query.toLowerCase());
                    },
                    onApplyButtonClick: (list) {

                      print('List : ${list!.length}');

                      List<QuotesBb> listSelectedQuotes = [];
                      List<QuotesBb> listQuotesU = [];

                      for (int i=0;i<list!.length;i++) {
                          print('author : ${list![i].author}');

                          for(int y=0;y<bbProvider.quotesU.length;y++) {
                            if ( bbProvider.quotesU[y].author == list![i].author ) {
                              listQuotesU.add(bbProvider.quotesU[y]);
                            }
                          }

                          for(int k=0;k<bbProvider.quotesToSel.length;k++) {
                            if ( bbProvider.quotesToSel[k].author == list![i].author ) {
                              listSelectedQuotes.add(bbProvider.quotesToSel[k]);
                            }
                          }
                       }
                       bbProvider.quotes = listSelectedQuotes;
                       bbProvider.quotesU = listQuotesU;
                       Navigator.pop(context);
                    },
                  );

              }
    }, icon: Icon(Icons.search, color: Color(0xff154F3C), size: 30,));
  }

  FilterListThemeData _FilterListThemeData(BuildContext context, Color bbColor3, Color bbColor2) {
    return FilterListThemeData(context, backgroundColor: bbColor3, 
                                                      controlButtonBarTheme: ControlButtonBarThemeData(context, backgroundColor: bbColor2, controlButtonTheme: ControlButtonThemeData(
                                                        textStyle: TextStyle(color: Colors.white),
                                                        primaryButtonTextStyle: TextStyle(color: Colors.white),
                                                        primaryButtonBackgroundColor: bbColor3,
                                                      ),
                                                      decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.white), borderRadius: BorderRadius.circular(50))
                                                      ),
                                                      headerTheme: HeaderThemeData(backgroundColor: bbColor3, searchFieldBackgroundColor: bbColor2,
                                                      headerTextStyle: TextStyle(color: Colors.white),
                                                      searchFieldHintTextStyle:  TextStyle(color: Colors.white),
                                                      searchFieldTextStyle:  TextStyle(color: Colors.white),
                                                      searchFieldIconColor: Colors.white,
                                                      ),
                                                      choiceChipTheme: ChoiceChipThemeData(
                                                        selectedBackgroundColor: bbColor2,
                                                        backgroundColor: bbColor3, textStyle: TextStyle(color: Colors.white,)),


              );
  }
}

class _ListMenuItems extends StatelessWidget {

  final Color bbColor2 = Color(0xff154F3C);
  @override
  Widget build(BuildContext context) {
    final bbProvider = Provider.of<BbProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Widget>.generate( bbProvider.itemsMenuSlider.length, (int idx) {

                  print('Selected in ListGenerate : ${bbProvider.menuSelected}');
                  if ( bbProvider.itemsMenuSlider[idx]['text'] == bbProvider.menuSelected ) {
                    return _BBImageButton(image: Image.asset(bbProvider.itemsMenuSlider[idx]['srcImage'], color: Colors.white) ,text: bbProvider.itemsMenuSlider[idx]['text'], number: bbProvider.itemsMenuSlider[idx]['number'],selected: true,);
                  } else {
                    return _BBImageButton(image: Image.asset(bbProvider.itemsMenuSlider[idx]['srcImage'], color: bbColor2) ,text: bbProvider.itemsMenuSlider[idx]['text'], number: bbProvider.itemsMenuSlider[idx]['number'], selected: false,);
                  } }));
  }
}

class _BBImageButton extends StatelessWidget {
  final Image image;
  final String text;
  final int number;
  final bool selected;

  const _BBImageButton({
    required this.image, required this.text, required this.selected, required this.number,
  });

  @override
  Widget build(BuildContext context) {

    final Color bbColor1 = Color(0xff0E5334);
    final Color bbColor2 = Color(0xff154F3C);
    final Color bbColor3 = Color(0xff078F3D);

    final bbProvider = Provider.of<BbProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),

      child: Column(
        children: [ 
     Stack(
       children: [
         Container(
            width: MediaQuery.of(context).size.width*0.15,
            height: MediaQuery.of(context).size.width*0.15,
            decoration: selected ? BoxDecoration( gradient: LinearGradient(
                                              begin: Alignment.bottomLeft,
                                              end: Alignment.topRight,
                                              colors: [bbColor1, bbColor2 ]),
                                        border: Border.all(width: 1, color:Colors.white)
                                      ) : null,
            child : GestureDetector( onTap: () { 

              // To avoid more click on the same menu
              if ( text == bbProvider.menuSelected ) return;
              
              bbProvider.menuSelected = text; 
              print('Selected $text');}, 
              child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(width: MediaQuery.of(context).size.width*0.3,height: MediaQuery.of(context).size.width*0.3, child: SizedBox(width: 40,child: image)),
            ))
            ),
            selected ? Positioned( right: 1, child: Padding( padding: const EdgeInsets.all(2.0), child: Text('12', style: TextStyle(color: Colors.white, fontSize: 5),)))
            : Container(),
       ],
     ),       
        SizedBox(height: 3,),
        Text(text, style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04 , fontFamily: 'Cooper', color: bbColor2, fontWeight: selected ? FontWeight.bold : null)),

        ],
      )


      
      
    );
  }
}
