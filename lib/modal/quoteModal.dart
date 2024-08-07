class QuoteModal{

  late List<Quotes> quotes;

  QuoteModal({required this.quotes});

  factory QuoteModal.fromJson(Map m1)
  {
    return QuoteModal(quotes: (m1['quotes'] as List).map((e)=>Quotes.fromJson(e)).toList());}
}

class Quotes{
  late String quote,author;
  late int id;

  Quotes({required this.quote,required this.author,required this.id});

  factory Quotes.fromJson(Map m1)
  {
    return Quotes(quote: m1['quote'], author: m1['author'], id: m1['id']);
  }
}