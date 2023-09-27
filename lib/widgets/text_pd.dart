import 'package:flutter/material.dart';

class TextPD extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final double fontSize;
  final int maxValuexLine;
  final int maxValuexNextLine;
  const TextPD({required this.label, required this.value, this.color=const Color(0xff0E5334), this.fontSize= 18, this.maxValuexLine = 16, this.maxValuexNextLine = 27,  });

  @override
  Widget build(BuildContext context) {

    List<Widget> valueLines = [];
    final size = MediaQuery.of(context).size;

    int idxFrom = 0;
    int idxTo = 0;

    while(idxFrom<value.length) {

      if ( idxTo == 0 ) {
          if ( idxFrom + maxValuexLine < value.length ) {
              idxTo = idxFrom + maxValuexLine;
              if ( value.substring(idxTo-1, idxTo) == ' ' ) idxTo--;
              if ( value.substring(idxTo-2, idxTo-1) == ' ' ) idxTo-=2;
              if ( value.substring(idxTo-3, idxTo-2) == ' ' ) idxTo-=3;
              if ( value.substring(idxTo-4, idxTo-3) == ' ' ) idxTo-=4;
          } else  {
            idxTo = value.length;

          }
      } else {
          if ( idxFrom + maxValuexNextLine < value.length ) {
              idxTo = idxFrom + maxValuexNextLine;
              if ( value.substring(idxTo-1, idxTo) == ' ' ) idxTo--;
              if ( value.substring(idxTo-2, idxTo-1) == ' ' ) idxTo-=2;
              if ( value.substring(idxTo-3, idxTo-2) == ' ' ) idxTo-=3;
              if ( value.substring(idxTo-4, idxTo-3) == ' ' ) idxTo-=4;
          } else  {
            idxTo = value.length;
          }
      }

      valueLines.add(
        Align(
          child: Column(
            children: [
              idxFrom != 0.0 ? const SizedBox(height: 5,) : Container(),
              Stack(
                children: [
                  SizedBox( width: idxFrom == 0.0 ? size.width-(label.length.toDouble()*13) : size.width-20, child: Text(value.substring(idxFrom,idxTo), style: TextStyle(fontFamily: 'MomsTypeWriter', color: color, fontSize: fontSize))),
                  Positioned(bottom:4, child: Container(width: idxFrom == 0.0 ? value.substring(idxFrom,idxTo).length*15 : size.width-20, height: 2, color: color.withOpacity(0.4),)),
                ]
              ),
            ],
          ),
        ));

      idxFrom = idxTo;

    }
  
    return Column(
      children: [
        Row(
          children: [
            Text(label, style: TextStyle(fontFamily: 'MomsTypeWriter', color: color, fontSize: fontSize, fontWeight: FontWeight.bold )),
            valueLines[0]]),
           Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
           (valueLines.length > 1 )?
            valueLines.getRange(1,valueLines.length).toList() : [Container()]
           )
      ],
    );
  }
}
