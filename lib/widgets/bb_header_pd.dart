import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BBHeaderPD extends StatelessWidget {
    const BBHeaderPD({super.key});

    @override Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
        final bbProvider = Provider.of<BbProvider>(context, listen: false);  

        return Row(
                children : [
                    ColorFiltered(
                        colorFilter : const ColorFilter.mode(
                            Colors.green,
                            BlendMode.modulate,
                        ),
                        child : Image.asset('assets/images/Albuquerque_Police_Department.png', width : size.width * 0.25),
                    ),

                    SizedBox(width : size.width * 0.03,),

                    Column(children : [
                        Text('ALBUQUERQUE POLICE', style : TextStyle(
                            fontFamily : 'MomsTypeWriter',
                            color : bbProvider.bbColor1,
                            fontSize : 18,
                            fontWeight : FontWeight.bold
                        )),
                        Text('DEPARTMENT', style : TextStyle(
                            fontFamily : 'MomsTypeWriter',
                            color : bbProvider.bbColor1,
                            fontSize : 18,
                            fontWeight : FontWeight.bold
                        ))
                    ],)
                ],
            );
        }
    }