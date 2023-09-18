// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String text;
  final String author;

  const QuoteCard({
    required this.text,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    final Color bbColor2 = Color(0xff154F3C);
    final Color bbColor3 = Color(0xff078F3D);

    String assetImage = 'assets/bb_${Random().nextInt(19)+1}.jpg';

    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8, left: 8),
      child: FadeIn(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height/4.8,
          decoration: BoxDecoration(
            image: DecorationImage( image: AssetImage(assetImage), fit: BoxFit.fill,colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),),
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            // gradient: LinearGradient( begin: Alignment.bottomLeft,
            //                           end: Alignment.topRight,
            //                           colors: [bbColor3, bbColor3])
          ),
          
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Container(alignment: Alignment.centerLeft, child: Text('"$text"', maxLines: 5, style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 14, fontFamily: 'Cooper'))),
              const SizedBox(height: 10,),
              Container(alignment: Alignment.centerRight, child: Text(author,style: TextStyle(color: Colors.black, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontFamily: 'Cooper')))
            ]),
          ),
        ),
      ),
    );
  }
}
