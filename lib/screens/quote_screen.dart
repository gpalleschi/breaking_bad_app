import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuoteScreen extends StatelessWidget {
  final String text;
  final String author;
  final String assetImage;

  // ignore: use_key_in_widget_constructors
  const QuoteScreen({required this.text, required this.author, required this.assetImage});

  @override
  Widget build(BuildContext context) {

    final bbProvider = Provider.of<BbProvider>(context);

    return 
    Scaffold(
      // backgroundColor: Colors.black,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: 
          GestureDetector(
      onTap: () {
        Navigator.of(context).pop();

      },
      child:
          Column( mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                     Container(alignment: Alignment.centerLeft, child: Text('"$text"', maxLines: 5, style: TextStyle(color: bbProvider.bbColor2, fontStyle: FontStyle.italic, fontSize: 18, fontFamily: 'Cooper'))),
                                         const SizedBox(height: 10,),
                                         Container(alignment: Alignment.centerRight, child: Text(author,style: TextStyle(color: bbProvider.bbColor2, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontFamily: 'Cooper'))),                        
                                         const SizedBox(height: 20,),
                              Image.asset(assetImage),
                            ])),
        )
        ),
    );
    
//     Scaffold( backgroundColor : Colors.grey[350],
//                      body : SafeArea(child : SingleChildScrollView(keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.onDrag,
//                      child : Padding(
//                        padding: const EdgeInsets.all(20.0),
//                        child: 
//  Container(
//         color: Colors.green,
//         width: double.infinity,
//         child: Align(
//           alignment: Alignment.center,
//           child: Container(
//             width: MediaQuery.of(context).size.width * 0.9,
//             height: 100,
//             color: Colors.amber,
//           ),
//         ),
//       )))));                      
 
                       
                       
                      //  Align(
                      //   alignment: Alignment.center,
                      //    child: Column( mainAxisAlignment: MainAxisAlignment.end,
                      //                   crossAxisAlignment: CrossAxisAlignment.center,
                      //                   children: [
                      //              Container(alignment: Alignment.centerLeft, child: Text('"$text"', maxLines: 5, style: TextStyle(color: bbProvider.bbColor2, fontStyle: FontStyle.italic, fontSize: 18, fontFamily: 'Cooper'))),
                      //                  const SizedBox(height: 10,),
                      //                  Container(alignment: Alignment.centerRight, child: Text(author,style: TextStyle(color: bbProvider.bbColor2, fontSize: 20, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontFamily: 'Cooper'))),                        
                      //       Image.asset(assetImage),
                      //     ],
                      //                ),
                      //  )))));
    
    
    // GestureDetector(
    //   onTap: () {
    //     Navigator.of(context).pop();

    //   },
    //   child: Text('prova')
  
    // );
    // return Stack(children: [
    //       Padding(
    //         padding: const EdgeInsets.all(15.0),
    //         child: Container(
    //           //width: double.infinity,
    //           decoration: BoxDecoration(
    //             image: DecorationImage( image: AssetImage(assetImage),),
    //           )),
    //       ),
    //       Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //             Container(alignment: Alignment.centerLeft, child: Text('"$text"', maxLines: 5, style: const TextStyle(color: Colors.black, fontStyle: FontStyle.italic, fontSize: 14, fontFamily: 'Cooper'))),
    //             const SizedBox(height: 10,),
    //             Container(alignment: Alignment.centerRight, child: Text(author,style: const TextStyle(color: Colors.black, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontFamily: 'Cooper')))
    //           ]),

    // ],);
  }
}