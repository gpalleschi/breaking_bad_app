import 'dart:ui';

import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:breaking_bad/providers/bb_provider.dart';

class DeathScreen extends StatelessWidget {

  final int idxDeath;

   
  const DeathScreen({
    required this.idxDeath,
  });
  
  @override
  Widget build(BuildContext context) {
    final Color bbColor1 = Color(0xff0E5334);
    final Color bbColor2 = Color(0xff154F3C);
    final Color bbColor3 = Color(0xff078F3D);
    final Color bbColor4 = Color.fromARGB(255, 32, 206, 101);
    final bbProvider = Provider.of<BbProvider>(context);  

    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        const BBHeaderPD(),
                     ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        TextPD(label: 'Death  : ', value: ' ${bbProvider.deaths[idxDeath].death}',maxValuexLine: 18,),
                        SizedBox(height: 10,),
                        TextPD(label: 'Death Cause : ', value: ' ${bbProvider.deaths[idxDeath].cause}', maxValuexLine: 14,),
                        SizedBox(height: 10,),
                        TextPD(label: 'Responsible : ', value: ' ${bbProvider.deaths[idxDeath].responsible}', maxValuexLine: 14,),
                        SizedBox(height: 10,),
                        TextPD(label: 'Last Words : ', value: ' ${bbProvider.deaths[idxDeath].lastWords}', maxValuexLine: 15,),
                        SizedBox(height: 10,),
                        TextPD(
                            label: 'Death Season : ',
                            value: ' ${bbProvider.deaths[idxDeath].season}',
                            maxValuexLine: 10,
                          ),
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
