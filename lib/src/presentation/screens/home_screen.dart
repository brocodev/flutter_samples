import 'package:flutter/material.dart';
import 'package:flutter_samples/src/presentation/widgets/linear_gradient_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LinearGradientContainer(
        child: Text('Body'),
      ),
    );
  }
}
