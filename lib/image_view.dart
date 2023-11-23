import 'package:flutter/material.dart';
import 'package:image_app/custom/image_box.dart';

class ImageView extends StatefulWidget {
  const ImageView(this.imagePath, this.userName, {super.key});
  final String imagePath;
  final String userName;
  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Images'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ImageBox('images/photo_1.jpg', 'Dog', widget.userName,
                    widget.imagePath),
                ImageBox('images/photo_2.jpg', 'Shoe', widget.userName,
                    widget.imagePath),
                ImageBox('images/photo_3.jpg', 'Car', widget.userName,
                    widget.imagePath),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
