import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_app/image_view.dart';

void main() {
  runApp(
    const MaterialApp(
      home: SignUpScr(),
    ),
  );
}

class SignUpScr extends StatefulWidget {
  const SignUpScr({super.key});

  @override
  State<SignUpScr> createState() => _SignUpScrState();
}

class _SignUpScrState extends State<SignUpScr> {
  ImageProvider prov = const AssetImage('images/blank_avatar.png');
  String? imageLocation = 'images/blank_avatar.png';
  String userName = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CircleAvatar(
                foregroundImage: prov,
                backgroundColor: const Color.fromARGB(142, 68, 137, 255),
                radius: 50,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  imageLocation = result.files.single.path;
                  setState(() {
                    File file = File(imageLocation!);
                    prov = FileImage(file);
                  });
                }
              },
              child: const Text('Add Avatar'),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  userName = value;
                },
                decoration: const InputDecoration(hintText: 'User Name'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (userName != '') {
                    setState(
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (cont) {
                              return ImageView(imageLocation!, userName);
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    setState(() {
                      showModalBottomSheet(
                          context: context,
                          builder: (ctxt) {
                            return const SizedBox(
                              height: 200,
                              child: Center(
                                  child: Text(
                                'Enter User name',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.redAccent),
                              )),
                            );
                          });
                    });
                  }
                },
                child: const Text('Go To Images'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
