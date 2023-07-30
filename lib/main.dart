import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  String message = ''; // Store the message entered in MyInput

  void onSendMessage(String newMessage) {
    setState(() {
      message = newMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatApp"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Message: $message',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          MyInput(onSendMessage: onSendMessage), // Pass the callback function
        ],
      ),
    );
  }
}

class MyInput extends StatefulWidget {
  final void Function(String) onSendMessage; // Define the callback function

  const MyInput({Key? key, required this.onSendMessage}) : super(key: key);

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.message_rounded),
                labelText: "Type the message you want to send!",
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              String message = _textEditingController.text;
              widget.onSendMessage(message); // Call the callback function
              _textEditingController.clear(); // Clear the text field after sending the message
            },
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
