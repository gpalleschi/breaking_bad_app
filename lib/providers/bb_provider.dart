import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:breaking_bad/models/models.dart';

class BbProvider extends ChangeNotifier {

    late List<CharactersBb> _charactersJson;
    late List<CharactersBb> _characters;
    late List<CharactersBb> _charactersToSel;
    late List<DeathsBb> _deathsJson;
    late List<DeathsBb> _deaths;
    late List<DeathsBb> _deathsToSel;
    late List<EpisodesBb> _episodesJson;
    late List<EpisodesBb> _episodes;
    late List<EpisodesBb> _episodesToSel;
    late List<QuotesBb> _quotesJson;
    late List<QuotesBb> _quotes;
    late List<QuotesBb> _quotesToSel;
    late List<QuotesBb> _quotesU;
    late List<QuotesBb> _quotesUToSel;

    final String bb = 'Breaking Bad';
    final String bcs = 'Better Call Saul';

    late String _menuSelected = 'Characters';
    set menuSelected (String value) {

      print('Setter _menuSelected with $value');
      _menuSelected = value;
      notifyListeners();
    }

    String get menuSelected => _menuSelected; 

    final List _itemsMenuSlider = [
      {'srcImage': 'assets/bbIcon.png', 'text': 'Characters', 'number': 13 },
      {'srcImage': 'assets/deathIcon.png', 'text': 'Deaths', 'number' : 25},
      {'srcImage': 'assets/filmIcon.png', 'text': 'Episodes', 'number' : 88},
      {'srcImage': 'assets/quotesIcon.png', 'text': 'Quotes', 'number': 31},
    ];
    List get itemsMenuSlider => _itemsMenuSlider;

    String _currentSeries = 'Breaking Bad';

    bool _isLoading = false;

    Future<List> readJson(String asset) async {
      final String response = await rootBundle.loadString(asset);
      final data = await json.decode(response);
      return data;
    }

    List<CharactersBb> get characters => _characters;
    List<CharactersBb> get charactersToSel => _charactersToSel;
    List get deaths => _deaths;
    List get deathsToSel => _deathsToSel;
    List get episodes => _episodes;

    List<QuotesBb> get quotes => _quotes;
    List<QuotesBb> get quotesToSel => _quotesToSel;
    List<QuotesBb> get quotesU => _quotesU;
    List<QuotesBb> get quotesUToSel => _quotesUToSel;

    set characters(List<CharactersBb> sel) {
      _characters = sel;
      notifyListeners();
    }

    set quotes(List<QuotesBb> sel) {
      _quotes = sel;
      notifyListeners();
    }
  
    set quotesU(List<QuotesBb> sel) {
      _quotesU = sel;
      notifyListeners();
    }

    Future<void> initialize() async {
      _charactersJson = (await readJson('assets/characters.json')).map( (item) => CharactersBb.fromMap(item)).toList(); ;
      _deathsJson = (await readJson('assets/deaths.json')).map((item) =>DeathsBb.fromMap(item)).toList();;
      _episodesJson = (await readJson('assets/episodes.json')).map((item) =>EpisodesBb.fromMap(item)).toList();
      _quotesJson = (await readJson('assets/quotes.json')).map((item) =>QuotesBb.fromMap(item)).toList();

      _deaths = [];
      _deathsToSel = [];

      // Ciclo di Lettura Deaths
      for(int i=0;i<_deathsJson.length;i++) {
        if ( _deathsJson[i].series == _currentSeries ) {
           _deaths.add(_deathsJson[i]);
           _deathsToSel.add(_deathsJson[i]);
        }
      }

      _characters = [];
      _charactersToSel = [];
      
      // Ciclo di Lettura Characters
      for(int i=0;i<_charactersJson.length;i++) {
        if ( _charactersJson[i].series == _currentSeries ) {

          _charactersToSel.add(_charactersJson[i]); 
          _characters.add(_charactersJson[i]);

          bool isDeath = false;
          for(int y=0;y<_deaths.length;y++) {
            if ( _deaths[y].series == _currentSeries && _charactersJson[i].name == _deaths[y].death ) {
              _characters[_characters.length-1].death = y;
              isDeath = true;
              break;
            }
          }

          if ( !isDeath ) {
             _characters[_characters.length-1].death = -1;
          }

        }
      }

      _quotes = [];
      _quotesToSel = [];
      _quotesU = [];
      _quotesUToSel = [];

      // Ciclo di Lettura Quotes
      for(int i=0;i<_quotesJson.length;i++) {
        if ( _quotesJson[i].series == _currentSeries ) {
          _quotes.add(_quotesJson[i]);
          _quotesToSel.add(_quotesJson[i]);

          int y = 0;
          for (y=0;y<_quotesU.length;y++) {
              if ( _quotesJson[i].author == _quotesU[y].author ) break;
          }

          if ( y == _quotesU.length ) {
            _quotesU.add(_quotesJson[i]);
            _quotesUToSel.add(_quotesJson[i]);
          }

        }
      }

      _episodes = [];
      _episodesToSel = [];

      // Ciclo di Lettura Episodes
      for(int i=0;i<_episodesJson.length;i++) {
        if ( _episodesJson[i].series == _currentSeries ) {
          _episodes.add(_episodesJson[i]);
          _episodesToSel.add(_episodesJson[i]);
        }
      }

      print('Characters loaded : ${_characters.length}');
      print('Deaths loaded : ${_deaths.length}');
      print('Episodes loaded : ${_episodes.length}');
      print('Quotes loaded : ${_quotes.length}');

    }

}