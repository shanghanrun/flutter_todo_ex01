import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Container(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                child: const Text('저장하기'),
                onPressed: () {
                  Navigator.of(context).pop(controller.value.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
