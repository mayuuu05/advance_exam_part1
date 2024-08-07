import 'package:advance_exam_part1/helper/service.dart';
import 'package:advance_exam_part1/modal/quoteModal.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteProvider extends ChangeNotifier{

  QuoteModal? quoteModal;
  QuotesHelper quotesHelper =QuotesHelper();
  List<String> quote1 = [];
  List<String> quote2 = [];

  Future<QuoteModal?> fetchQuotes()
  async {
    final data = await quotesHelper.fetchData();
    quoteModal = QuoteModal.fromJson(data as Map);
    return quoteModal;
  }

  Future<void> addFavourite(String quote)
  async {
    String data = "$quote";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    quote1.add(data);
    sharedPreferences.setStringList('quote', quote1);
  }
  Future<void> addFavourite2(String author)
  async {
    String data = "$author";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    quote2.add(data);
    sharedPreferences.setStringList('quote', quote2);
  }

  Future<void> getFavourite()
  async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> quote1 = sharedPreferences.getStringList('weather') ?? <String>[];
    notifyListeners();
  }

  QuoteProvider()
  {
    getFavourite();
  }
}
