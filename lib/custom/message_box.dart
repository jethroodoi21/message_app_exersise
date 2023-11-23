import 'dart:io';

import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox(this.comment, this.imagePath, this.userName, {super.key});

  final String comment;
  final String userName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    ImageProvider prov = AssetImage(imagePath);
    File file = File(imagePath);
    prov = FileImage(file);
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Row(
        children: [
          CircleAvatar(
            foregroundImage: prov,
          ),
          Column(
            children: [
              Text(' $userName',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text(
                comment,
                style:
                    const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ],
          )
        ],
      ),
    );
  }
}
