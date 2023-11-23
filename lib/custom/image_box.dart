import 'package:flutter/material.dart';
import 'package:image_app/custom/message_box.dart';

class ImageBox extends StatefulWidget {
  ImageBox(this.imagePath, this.boxTitle, this.userName, this.profileImagePath,
      {super.key});
  String imagePath = '';
  String boxTitle = '';
  String userName = '';
  String profileImagePath = '';

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox> {
  List<Widget> coments = [];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 550,
        width: 500,
        child: Card(
          color: const Color.fromARGB(255, 244, 244, 244),
          child: Column(
            children: [
              Center(
                child: Text(
                  widget.boxTitle,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset(widget.imagePath)),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    color: Colors.blueAccent,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(children: coments),
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctxt) {
                          String msg = '';
                          return SizedBox(
                            height: 200,
                            child: Card(
                              child: Column(children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: TextField(
                                    onChanged: (value) {
                                      msg = value;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: 'Enter Message'),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        coments.add(MessageBox(
                                            msg,
                                            widget.profileImagePath,
                                            widget.userName));
                                        Navigator.pop(ctxt);
                                      });
                                    },
                                    child: const Text('Send'))
                              ]),
                            ),
                          );
                        },
                      );
                    });
                  },
                  child: const Text('Add Message'))
            ],
          ),
        ),
      ),
    );
  }
}
