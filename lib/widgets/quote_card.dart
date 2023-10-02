// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/screens/quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuoteCard extends StatelessWidget {
  final String text;
  final String author;

  // ignore: use_key_in_widget_constructors
  const QuoteCard({
    required this.text,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {

    final bbProvider = Provider.of<BbProvider>(context, listen: false);  
    String assetImage = 'assets/quote_images/bb_${Random().nextInt(bbProvider.totImagesQuote)+1}.jpg';

    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 8, left: 8),
      child: FadeIn(
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder
                    : (BuildContext context) => QuoteScreen(assetImage: assetImage, author: author, text: text,)));
          },
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height/4.8,
            decoration: BoxDecoration(
              image: DecorationImage( image: AssetImage(assetImage), fit: BoxFit.fill,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),),
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(alignment: Alignment.centerLeft, child: Text('"$text"', maxLines: 5, style: const TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 14, fontFamily: 'Cooper'))),
                const SizedBox(height: 10,),
                Container(alignment: Alignment.centerRight, child: Text(author,style: const TextStyle(color: Colors.black, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontFamily: 'Cooper')))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
