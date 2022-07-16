import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';

import '../models/image.model.dart';
import '../service/apiService.dart';

class ImagePage extends StatefulWidget {
  final String id;
  const ImagePage({Key? key, required this.id}) : super(key: key);

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late Img img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: APIService().getImage(widget.id),
        initialData: Img(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            img = snapshot.data as Img;
            return Container(
              color: Colors.yellow,
              child: Image.network(img.imgUrl ?? Config.noImage),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
