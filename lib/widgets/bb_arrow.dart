import 'package:flutter/material.dart';

class BBArrow extends StatelessWidget {
    const BBArrow({super.key});
    

    @override Widget build(BuildContext context) {
        final size = MediaQuery.of(context).size;
        return Container(
                height : 100,
                alignment : AlignmentDirectional.center,
                child : ColorFiltered(
                    colorFilter : const ColorFilter.mode(Colors.green, BlendMode.modulate,),
                    child : GestureDetector(onTap : () {
                        Navigator
                            .of(context)
                            .pop();
                    }, child : Image.asset('assets/images/arrow.png', width : size.width * 0.25)),
                ),
            );
        }
    }