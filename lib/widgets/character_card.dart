import 'package:animate_do/animate_do.dart';
import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/widgets/bb_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CharacterCard extends StatelessWidget {
  final String imgPath;
  final String characterName;

  // ignore: use_key_in_widget_constructors
  const CharacterCard({required this.imgPath, required this.characterName});

  @override
  Widget build(BuildContext context) {

    final double displayWidth = MediaQuery.of(context).size.width;

    final bbProvider = Provider.of<BbProvider>(context, listen: false);  

    return SlideInLeft(
      child: Hero(
        tag: 'CharacterCard$characterName',
        child: Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), 
                  //boxShadow:[BoxShadow( color: Colors.green.withOpacity(0.3), offset: Offset(2,3), blurRadius: 10),],
                                           //border: Border.all(width: 3, color: Colors.black),
                  ),
                  alignment: Alignment.center,
          child: Stack(
                alignment: AlignmentDirectional.center,
                children: [_CharacterImage(imgPath: imgPath),
                           Positioned( bottom: 0,
                                       child: Container(
                decoration: BoxDecoration( borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), 
                                           bottomRight: Radius.circular(20)),
                                           gradient: LinearGradient(
                                            begin: Alignment.bottomLeft,
                                            end: Alignment.topRight,
                                            colors: [bbProvider.bbColor3, bbProvider.bbColor3                                ])
                                         ),
                width: displayWidth-40,
                height: 50,
                alignment: Alignment.center,
                child: BBtext(text:characterName, type: 'PT1'),
                )),
                ]),
        ),
      ),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  const _CharacterImage({
    required this.imgPath,
  });

  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image(image: NetworkImage(imgPath))
    );
  }
}