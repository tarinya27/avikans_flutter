
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Notes(title: 'Notes'),
    );
  }
}

class Notes extends StatefulWidget {
  const Notes({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  File? _image;
  final picker = ImagePicker();
  TextEditingController _descriptionController = TextEditingController();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JOB PROCESSOR',
          textAlign: TextAlign.center,
        ),
        centerTitle: true, // Center the title
        backgroundColor: const Color(0xFFB993D6), // Set app bar background color
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Hi! Take a currently working jobs',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: getImage,
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: _image == null
                            ? const Center(
                                child: Icon(Icons.camera_alt),
                              )
                            : Image.file(_image!),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Take a photo',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    // Textbox for writing description
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Note:- Write a description and enter the job items',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        maxLines: 3,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
                Positioned(
                  bottom: -30,
                  right: -30,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB993D6), // Use the same color as app bar
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: -30, // Adjust position for the left half circle
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB993D6), // Use the same color as app bar
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
