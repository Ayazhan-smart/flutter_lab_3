import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showImage = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("lab_3"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                "https://yandex.kz/images/search?from=tabbar&img_url=https%3A%2F%2Fi.sstatic.net%2FO7Axz.png&lr=162&pos=41&rpt=simage&text=flutter ",
              ),
              const SizedBox(height: 40),
              Image.asset(
                "assets/image1.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              buildStack(),
              buildButtons(),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
       
        Image.asset(
          "assets/image1.jpg",
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
       
        Container(
          width: 300,
          height: 300,
          color: Colors.black.withOpacity(0.5),
        ),
        
        const Text(
          "Welcome to Flutter",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildButtons() {
    return Column(
      children: [
        
        ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('SnackBar is shown')),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,      
            foregroundColor: Colors.white,     
            minimumSize: const Size(200, 50),  
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Show SnackBar"),
        ),
        const SizedBox(height: 20),
        
        TextButton(
          onPressed: () {
          },
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,      
            minimumSize: const Size(200, 50),   
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Go to Second Screen"),
        ),
        const SizedBox(height: 20),
        
        OutlinedButton(
          onPressed: () {
            setState(() {
              _showImage = !_showImage; 
            });
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,             
            minimumSize: const Size(200, 50),          
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: const Text("Toggle Image"),
        ),

        const SizedBox(height: 20),
        _showImage
            ? Image.asset(
                "assets/image1.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              )
            : Container(), 
      ],
    );
  }
}