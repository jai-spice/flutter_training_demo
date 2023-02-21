import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformTestWidget extends StatefulWidget {
  const PlatformTestWidget({super.key});

  @override
  State<PlatformTestWidget> createState() => _PlatformTestWidgetState();
}

class _PlatformTestWidgetState extends State<PlatformTestWidget> {
  static const platform = MethodChannel('com.example.demo/test');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            if (kIsWeb) {
              //
            } else {
              platform.invokeMethod('showToast', 'Flutter is the best!');
            }
          },
          child: const Text('Show Toast'),
        ),
      ),
    );
  }
}
