import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _image;
  final imagePicker = ImagePicker();
  Future getImage(ImageSource source) async{
    final image = await imagePicker.pickImage(source: source);
    if (image == null ) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,

        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100,
              width: 10,
            ),
            Column(
              children: [
                _image!= null? Image.file(_image!, width: 300, height: 300, fit: BoxFit.cover,) : Image.asset('assets/images/sharukh.jpg', width: 300, height: 300, fit: BoxFit.cover,),
              ],
            ),
            SizedBox(
              height: 100,
              width: 10,
            ),
            
            Container(
              child: Column(
                children: [
                  Container(
                    child: GestureDetector(
                    onTap: () { 
                    getImage(ImageSource.camera);
                    },
                    child: Container(
                      height: 50,
                      width: 300,
                     decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Color(0xFF363263),
                     ),
                      child: Center(
                        child: Text(
                          "Click a photo",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
      
                     ),
      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}