import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final bbProvider = Provider.of<BbProvider>(context, listen: false);

    return FutureBuilder(
        future: bbProvider.initialize(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return const MainScreen();
          } else {
            return SplashScreen();
          }
        },
      );
  }
}