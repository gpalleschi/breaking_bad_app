import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:breaking_bad/providers/bb_provider.dart';

class DeathScreen extends StatelessWidget {

  final int idxDeath;
   
  // ignore: use_key_in_widget_constructors
  const DeathScreen({
    required this.idxDeath,
  });
  
  @override
  Widget build(BuildContext context) {
    final bbProvider = Provider.of<BbProvider>(context);  
    final size = MediaQuery.of(context).size;

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
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                        BBHeaderPD(),
                     ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15,),
                        TextPD(label: 'Death  : ', value: ' ${bbProvider.deaths[idxDeath].death}',maxValuexLine: 18,),
                        const SizedBox(height: 10,),
                        TextPD(label: 'Death Cause : ', value: ' ${bbProvider.deaths[idxDeath].cause}', maxValuexLine: 14,),
                        const SizedBox(height: 10,),
                        TextPD(label: 'Responsible : ', value: ' ${bbProvider.deaths[idxDeath].responsible}', maxValuexLine: 14,),
                        const SizedBox(height: 10,),
                        TextPD(label: 'Last Words : ', value: ' ${bbProvider.deaths[idxDeath].lastWords}', maxValuexLine: 15,),
                        const SizedBox(height: 10,),
                        TextPD(
                            label: 'Death Season : ',
                            value: ' ${bbProvider.deaths[idxDeath].season}',
                            maxValuexLine: 10,
                          ),
                        const SizedBox(height: 7,),
                        const BBArrow(),
                        const SizedBox(height: 7,),
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
