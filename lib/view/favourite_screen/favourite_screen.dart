import 'package:advance_exam_part1/provider/quoteProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modal/quoteModal.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuoteProvider quoteProviderTrue =
    Provider.of<QuoteProvider>(context, listen: true);
    QuoteProvider quoteProviderFalse =
    Provider.of<QuoteProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0C1224),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff0C1224),
          scrolledUnderElevation: 0.4,
          title: Text(
            "My Favourites",
            style: TextStyle(color: Colors.white, fontSize: 24,fontWeight: FontWeight.bold),
          ),
          leading: IconButton(onPressed: () {
            Navigator.of(context).pop();
          }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
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
        body:  FutureBuilder(
          future: quoteProviderFalse.fetchQuotes(),
          builder: (context, snapshot) {
            QuoteModal? quote = snapshot.data;
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Column(
                  children: [   ...List.generate(
                    quoteProviderTrue.quote1.length,
                        (index) => Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(
                        color: Colors.grey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                quoteProviderTrue.quote1[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    "~ ${quoteProviderTrue.quote2[index]}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),


                      ),
                    ),
                  ),
                  ],
                ),
              );
            }
            else
            {
              return Center(child: Image.network("https://cdni.iconscout.com/illustration/premium/thumb/man-giving-feedback-5815817-4849489.png?f=webp",height: 300,),);
            }
          },
        ),
      ),
      );
  }
}
