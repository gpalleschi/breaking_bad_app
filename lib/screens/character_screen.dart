// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:breaking_bad/providers/bb_provider.dart';

class CharacterScreen extends StatelessWidget {

  final int idxCharacter;

   
  const CharacterScreen({
    required this.idxCharacter,
  });
  
  @override
  Widget build(BuildContext context) {
    final Color bbColor1 = Color(0xff0E5334);
    final Color bbColor2 = Color(0xff154F3C);
    final Color bbColor3 = Color(0xff078F3D);
    final Color bbColor4 = Color.fromARGB(255, 32, 206, 101);
    final bbProvider = Provider.of<BbProvider>(context);  

    final size = MediaQuery.of(context).size;


    final int idxDeath = bbProvider.characters[idxCharacter].death;

    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: SafeArea(
        child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top:10 ),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        const BBHeaderPD(),
                     Hero(
                              tag: 'CharacterCard${bbProvider.characters[idxCharacter].name}',
                       child: Stack(
                         alignment: AlignmentDirectional.center,
                         children: [
                           Image(width: size.width*0.4 ,image: NetworkImage(bbProvider.characters[idxCharacter].imageUrl)),
                           idxDeath >= 0 ? Positioned(bottom: 10,  child: Image.asset('assets/deceased.png', width: size.width*0.40)) : Container(),
                         ],
                       ),
                     ),
                     ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       SizedBox(height: 15,),
                       TextPD(label: 'Nr°   : ', value: '    $idxCharacter   ',),
                       SizedBox(height: 7,),
                       TextPD(label: 'Name  : ', value: ' ${bbProvider.characters[idxCharacter].name}',maxValuexLine: 18,),
                       SizedBox(height: 7,),
                       TextPD(label: 'Full Name : ', value: ' ${bbProvider.characters[idxCharacter].fullName}'),
                       SizedBox(height: 7,),
                       TextPD(label: 'Actor : ', value: ' ${bbProvider.characters[idxCharacter].portrayed}'),
                       SizedBox(height: 7,),
                       TextPD(label: 'Birth. : ', value: ' ${bbProvider.characters[idxCharacter].birthDate}', maxValuexLine: 20,),
                       SizedBox(height: 7,),
                       TextPD(label: 'Ocupation : ', value: ' ${bbProvider.characters[idxCharacter].occupation.join(' , ')}', maxValuexLine: 16,),
                       SizedBox(height: 7,),
                       TextPD(label: 'Episodes : ', value: ' ${bbProvider.characters[idxCharacter].episodesCount}'),
                       SizedBox(height: 7,),
                       TextPD(label: 'Seasons : ', value: ' ${bbProvider.characters[idxCharacter].appearances.join(', ')}', maxValuexLine: 19,),
                       SizedBox(height: 7,),
                       if ( idxDeath > 0 ) ...[
                          TextPD(label: 'Death Cause : ', value: ' ${bbProvider.deaths[idxDeath].cause}', maxValuexLine: 14,),
                          SizedBox(height: 7,),
                          TextPD(label: 'Responsible : ', value: ' ${bbProvider.deaths[idxDeath].responsible}', maxValuexLine: 14,),
                          SizedBox(height: 7,),
                          TextPD(label: 'Last Words : ', value: ' ${bbProvider.deaths[idxDeath].lastWords}', maxValuexLine: 15,),
                          SizedBox(height: 7,),
                          TextPD(
                            label: 'Death Season : ',
                            value: ' ${bbProvider.deaths[idxDeath].season}',
                            maxValuexLine: 10,
                          ),
                        ],
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 100,
                          alignment: AlignmentDirectional.center,
                          child: ColorFiltered(
                            colorFilter: const ColorFilter.mode(
                              Colors.green,
                              BlendMode.modulate,
                            ),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Image.asset('assets/arrow.png',
                                    width: size.width * 0.25)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
