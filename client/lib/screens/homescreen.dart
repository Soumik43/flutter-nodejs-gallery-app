import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../service/apiService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: APIService().getImages(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.data != null
              ? GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  children: List.generate(
                    snapshot.data.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlipCard(
                          direction: FlipDirection.VERTICAL,
                          front: Image.network(
                            snapshot.data[index].imgUrl ??
                                'https://as2.ftcdn.net/v2/jpg/04/70/29/97/1000_F_470299797_UD0eoVMMSUbHCcNJCdv2t8B2g1GVqYgs.jpg',
                          ),
                          back: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data[index].imgName,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.black),
                              ),
                              Text(
                                snapshot.data[index].imgDetails,
                                style: Theme.of(context).textTheme.headline6,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
