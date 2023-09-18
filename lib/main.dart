import 'package:breaking_bad/providers/bb_provider.dart';
import 'package:breaking_bad/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => BbProvider() ),
      ],
      child: const _BodyApp(),
    ); 
  }
}

class _BodyApp extends StatelessWidget {
  const _BodyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Breaking Bad',
      initialRoute: 'home',
      //  scaffoldMessengerKey: NotificationsService.messengerKey,
      routes: {
        'home' : (BuildContext context) => const HomeScreen(),
      },
      // // Impostiamo lo sfondo dello scaffold
      // // in questa area settiamo il tema dell'app
      // theme: ContaClaraTheme.themeData,
      // supportedLocales: L10n.all,
      // locale: const Locale('pt'),
      // localizationsDelegates: const [
      //   AppLocalizations.delegate, // Add this line
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      
    );
  }
}