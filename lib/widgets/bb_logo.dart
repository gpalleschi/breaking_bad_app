import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BBLogo extends StatelessWidget {
  const BBLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              BBtext(text:'Breaking', type: 'PT1', sizeSquare: 55, sizeText: 40, sizeTextElemNum: 7.5,centered: false,),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: BBtext(text:'Bad', type: 'PT1', sizeSquare: 55, sizeText: 40, sizeTextElemNum: 7.5,centered: false,),
              ),
            ],
          ),
        ],
      );
  }
}