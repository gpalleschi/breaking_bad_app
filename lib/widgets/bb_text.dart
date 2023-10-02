import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class BBtext extends StatelessWidget {

  final String text;
  final List<int> elemNum;
  final String type; 
  final double sizeSquare;
  final double sizeText;
  final double sizeTextElemNum;
  final bool centered;
  
  // First : Only first two letters of First Name, Surname, ...
  // PT1 : Periodic Table only first character in Periodic Table 

  // ignore: use_key_in_widget_constructors
  const BBtext({required this.text, this.elemNum = const [12,34,45,23,45], this.type = 'first', this.sizeSquare = 40, this.sizeText = 23, this.sizeTextElemNum = 5, this.centered = true});

  @override
  Widget build(BuildContext context) {

    final bbProvider = Provider.of<BbProvider>(context, listen: false);  

    final Map<String, int> periodicTable = {
        'H' : 1,
        'He' : 2,
        'Li' : 3,
        'Be' : 4,
        'B' : 5,
        'C' : 6,
        'N' : 7,
        'O' : 8,
        'F' : 9,
        'Ne' : 10,
        'Na' : 11,
        'Mg' : 12,
        'Al' : 13,
        'Si' : 14,
        'P' : 15,
        'S' : 16,
        'Cl' : 17,
        'Ar' : 18,
        'K' : 19,
        'Ca' : 20,
        'Sc' : 21,
        'Ti' : 22,
        'V' : 23,
        'Cr' : 24,
        'Mn' : 25,
        'Fe' : 26,
        'Co' : 27,
        'Ni' : 28,
        'Cu' : 29,
        'Zn' : 30,
        'Ga' : 31,
        'Ge' : 32,
        'As' : 33,
        'Se' : 34,
        'Br' : 35,
        'Kr' : 36,
        'Rb' : 37,
        'Sr' : 38,
        'Y' : 39,
        'Zr' : 40,
        'Nb' : 41,
        'Mo' : 42,
        'Tc' : 43,
        'Ru' : 44,
        'Rh' : 45,
        'Pd' : 46,
        'Ag' : 47,
        'Cd' : 48,
        'In' : 49,
        'Sn' : 50,
        'Sb' : 51,
        'Te' : 52,
        'I' : 53,
        'Xe' : 54,
        'Cs' : 55,
        'Ba' : 56,
        'La' : 57,
        'Ce' : 58,
        'Pr' : 59,
        'Nd' : 60,
        'Pm' : 61,
        'Sm' : 62,
        'Eu' : 63,
        'Gd' : 64,
        'Tb' : 65,
        'Dy' : 66,
        'Ho' : 67,
        'Er' : 68,
        'Tm' : 69,
        'Yb' : 70,
        'Lu' : 71,
        'Hf' : 72,
        'Ta' : 73,
         'W' : 74,
        'Re' : 75,
        'Os' : 76,
        'Ir' : 77,
        'Pt' : 78,
        'Au' : 79,
        'Hg' : 80,
        'Tl' : 81,
        'Pb' : 82,
        'Bi' : 83,
        'Po' : 84,
        'At' : 85,
        'Rn' : 86,
        'Fr' : 87,
        'Ra' : 88,
        'Ac' : 89,
        'Th' : 90,
        'Pa' : 91,
        'U' : 92,
        'Np' : 93,
        'Pu' : 94,
        'Am' : 95,
        'Cm' : 96,
        'Bk' : 97,
        'Cf' : 98,
        'Es' : 99,
        'Fm' : 100,
        'Md' : 101,
        'No' : 102,
        'Lr' : 103,
        'Rf' : 104,
        'Db' : 105,
        'Sg' : 106,
        'Bh' : 107,
        'Hs' : 108,
        'Mt' : 109,
        'Ds' : 110,
        'Rg' : 111,
        'Cn' : 112,
        'Nh' : 113,
        'Fl' : 114,
        'Mc' : 115,
        'Lv' : 116,
        'Ts' : 117,
        'Og' : 118,
    };

    List<Widget> textBB = [];

    switch ( type ) {
      case 'first': 
        final words = text.split(' ');
        for(int i = 0; i<words.length; i++) {
          textBB.add(_SquareBB(bbColor1: bbProvider.bbColor1, bbColor2: bbProvider.bbColor2, text: words[i].substring(0,2), elemNum: elemNum[i], sizeText: sizeText,sizeSquare: sizeSquare, sizeTextElemNum: sizeTextElemNum),);
          textBB.add(const SizedBox(width: 2,));
          textBB.add(_StandardBB(text: '${words[i].substring(2)} ', bbColor2: bbProvider.bbColor2, sizeText: sizeText,));
        }
        break;
      case 'PT1':
        String toSearch = '';
        // print('DEBUG to search : $text' );
        for(int i = 0; i<text.length; i++) {
          // print('DEBUG text : >${text.substring(i,i+1)}< i : $i');
          toSearch = text.substring(i,i+1).toUpperCase();
          if ( i + 1 < text.length ) {
            toSearch = toSearch + text.substring(i+1,i+2);
            // print('DEBUG Search 2 chars : ${toSearch}');

            if ( periodicTable.containsKey(toSearch) ) {
              if ( i > 0 ) textBB.add(const SizedBox(width: 2,));
              textBB.add(_SquareBB(bbColor1: bbProvider.bbColor1, bbColor2: bbProvider.bbColor2, text: toSearch, elemNum: periodicTable[toSearch]!, sizeText: sizeText,sizeSquare: sizeSquare, sizeTextElemNum: sizeTextElemNum),);
              textBB.add(const SizedBox(width: 2,));
              textBB.add(_StandardBB(text: '${text.substring(i+2)} ', bbColor2: bbProvider.bbColor2, sizeText: sizeText,));
              break;
            } 
            toSearch = text.substring(i,i+1).toUpperCase();
          }
          // print('DEBUG Search 1 Char : ${toSearch}');
          if ( periodicTable.containsKey(toSearch) ) {
             textBB.add(_SquareBB(bbColor1: bbProvider.bbColor1, bbColor2: bbProvider.bbColor2, text: toSearch, elemNum: periodicTable[toSearch]!, sizeText: sizeText, sizeSquare: sizeSquare, sizeTextElemNum: sizeTextElemNum),);
             textBB.add(const SizedBox(width: 2,));
             textBB.add(_StandardBB(text: '${text.substring(i+1)} ', bbColor2: bbProvider.bbColor2, sizeText: sizeText,));
             break;
          } 
          textBB.add(_StandardBB(text: text.substring(i,i+1) , bbColor2: bbProvider.bbColor2, sizeText: sizeText,));
        }  
    }

    return Row(
      mainAxisAlignment: centered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: textBB,
    );
  }
}

class _StandardBB extends StatelessWidget {
  final double sizeText;
  final String text;
  final Color bbColor2;
  
  const _StandardBB({
    super.key,
    required this.text,
    required this.bbColor2, 
    required this.sizeText, 
  });


  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.transparent, child: Text(text, style: TextStyle(color: bbColor2, fontSize: sizeText, fontWeight: FontWeight.bold, fontFamily: 'Cooper')));
  }
}

class _SquareBB extends StatelessWidget {
  const _SquareBB({
    required this.bbColor1,
    required this.bbColor2,
    required this.text,
    required this.elemNum, 
    required this.sizeText, 
    required this.sizeSquare, 
    required this.sizeTextElemNum,
  });

  final Color bbColor1;
  final Color bbColor2;
  final String text;
  final double sizeText;
  final int elemNum;
  final double sizeSquare;
  final double sizeTextElemNum;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        height: sizeSquare, width: sizeSquare, 
        alignment: Alignment.center,
        decoration : BoxDecoration( gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          end: Alignment.topRight,
                                          colors: [bbColor1, bbColor2 ]),
                                    border: Border.all(width: 1, color:Colors.white)
                                  ),
        child: Material(color: Colors.transparent, child: Text(text, style: TextStyle(color: Colors.white, fontSize: sizeText, fontWeight: FontWeight.bold, fontFamily: 'HelveticaNow'))),
        ),
        Positioned(
          right: 1,
          child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Material(color: Colors.transparent, child: Text('$elemNum', style: TextStyle(color: Colors.white, fontSize: sizeTextElemNum),)),
        ))
      ],
    );
  }
}