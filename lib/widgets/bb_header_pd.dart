import 'package:flutter/material.dart';

class BBHeaderPD extends StatelessWidget {
    const BBHeaderPD({super.key});

    @override Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
        final Color bbColor1 = Color(0xff0E5334);

        return Row(
                children : [
                    ColorFiltered(
                        colorFilter : const ColorFilter.mode(
                            // Color(0xff078F3D),
                            Colors.green,
                            BlendMode.modulate,
                        ),
                        child : Image.asset('assets/Albuquerque_Police_Department.png', width : size.width * 0.25),
                    ),
                    // Image(width: size.width*0.25 ,image:
                    // AssetImage('assets/Albuquerque_Police_Department.png')),

                    SizedBox(width : size.width * 0.03,),

                    Column(children : [
                        Text('ALBUQUERQUE POLICE', style : TextStyle(
                            fontFamily : 'MomsTypeWriter',
                            color : bbColor1,
                            fontSize : 18,
                            fontWeight : FontWeight.bold
                        )),
                        Text('DEPARTMENT', style : TextStyle(
                            fontFamily : 'MomsTypeWriter',
                            color : bbColor1,
                            fontSize : 18,
                            fontWeight : FontWeight.bold
                        ))
                    ],)
                ],
            );
        }
    }