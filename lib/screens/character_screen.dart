// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:breaking_bad/providers/bb_provider.dart';

class CharacterScreen extends StatelessWidget {

  final int idxCharacter;
   
  // ignore: use_key_in_widget_constructors
  const CharacterScreen({
    required this.idxCharacter,
  });
  
  @override
  Widget build(BuildContext context) {
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
                           idxDeath >= 0 ? Positioned(bottom: 10,  child: Image.asset('assets/images/deceased.png', width: size.width*0.40)) : Container(),
                         ],
                       ),
                     ),
                     ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                       const SizedBox(height: 15,),
                       TextPD(label: 'Nr°   : ', value: '    $idxCharacter   ',),
                       const SizedBox(height: 7,),
                       TextPD(label: 'Name  : ', value: ' ${bbProvider.characters[idxCharacter].name}',maxValuexLine: 18,),
                       const SizedBox(height: 7,),
                       TextPD(label: 'Full Name : ', value: ' ${bbProvider.characters[idxCharacter].fullName}'),
                       const SizedBox(height: 7,),
                       TextPD(label: 'Actor : ', value: ' ${bbProvider.characters[idxCharacter].portrayed}'),
                       const SizedBox(height: 7,),
                       TextPD(label: 'Birth. : ', value: ' ${bbProvider.characters[idxCharacter].birthDate}', maxValuexLine: 20,),
                       const SizedBox(height: 7,),
                       TextPD(label: 'Ocupation : ', value: ' ${bbProvider.characters[idxCharacter].occupation.join(' , ')}', maxValuexLine: 16,),
                       const SizedBox(height: 7,),
                       TextPD(label: 'Episodes : ', value: ' ${bbProvider.characters[idxCharacter].episodesCount}'),
                       const SizedBox(height: 7,),
                       TextPD(label: 'Seasons : ', value: ' ${bbProvider.characters[idxCharacter].appearances.join(', ')}', maxValuexLine: 19,),
                       const SizedBox(height: 7,),
                       if ( idxDeath > 0 ) ...[
                          TextPD(label: 'Death Cause : ', value: ' ${bbProvider.deaths[idxDeath].cause}', maxValuexLine: 14,),
                          const SizedBox(height: 7,),
                          TextPD(label: 'Responsible : ', value: ' ${bbProvider.deaths[idxDeath].responsible}', maxValuexLine: 14,),
                          const SizedBox(height: 7,),
                          TextPD(label: 'Last Words : ', value: ' ${bbProvider.deaths[idxDeath].lastWords}', maxValuexLine: 15,),
                          const SizedBox(height: 7,),
                          TextPD(
                            label: 'Death Season : ',
                            value: ' ${bbProvider.deaths[idxDeath].season}',
                            maxValuexLine: 10,
                          ),
                        ],
                        const SizedBox( height: 7,),
                        const BBArrow(),
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
