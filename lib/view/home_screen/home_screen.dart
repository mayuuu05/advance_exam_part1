import 'package:advance_exam_part1/modal/quoteModal.dart';
import 'package:advance_exam_part1/provider/quoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteModal? quoteModal;
    QuoteProvider quoteProviderTrue =
        Provider.of<QuoteProvider>(context, listen: true);
    QuoteProvider quoteProviderFalse =
        Provider.of<QuoteProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0C1224),
        appBar: AppBar(
          leading: Icon(Icons.format_quote,color: Colors.white,),
          centerTitle: true,
          backgroundColor: Color(0xff0C1224),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/like');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                ),
              ),
            )
          ],scrolledUnderElevation: 0.4,
          title: Text(
            "QuotesApp",
            style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(4.0),
            child: Container(
              height: 1.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    spreadRadius: 0.5,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ),


        body: FutureBuilder(
          future: quoteProviderFalse.fetchQuotes(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              QuoteModal? quote = snapshot.data;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: quote!.quotes.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Card(
                              color: Colors.grey[200],
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(quote!.quotes[index].quote,style: TextStyle(
                                          fontSize: 15
                                      ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [

                                          GestureDetector(
                                            onTap:() {
                                              quoteProviderTrue.quote1.add(quote.quotes[index].quote);
                                              quoteProviderTrue.quote2.add(quote.quotes[index].author);
                                              quoteProviderFalse.getFavourite();
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                      'Favourite Added!!',style: TextStyle(
                                                    color: Colors.black
                                                  ),),
                                                  action: SnackBarAction(
                                                    label: '',
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              );
                                            },

                                            child: Container(
                                              height: 40,
                                              width: 150,
                                              decoration: BoxDecoration(
                                                color: Color(0xff0C1224),
                                                borderRadius: BorderRadius.circular(8)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text('Add to favourite',style: TextStyle(color: Colors.white),),
                                                  Icon(Icons.favorite_outline,size: 17,color: Colors.white,)
                                                ],
                                              ),
                                            ),
                                          ),

                                          Spacer(),
                                          Text("~ ${quote!.quotes[index].author}",style: TextStyle(fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ) ,
                                  ],
                                ),
                              ),
                    
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            else if(snapshot.hasError)
              {
                return Center(child: Text("${snapshot.error}"),);
              }
            else
              {
                return Center(child: CircularProgressIndicator(color: Colors.white,));
              }
          },
        ),
      ),
    );
  }
}
