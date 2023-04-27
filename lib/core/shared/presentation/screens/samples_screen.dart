import 'package:flutter/material.dart';
import 'package:flutter_samples/core/shared/domain/entities/sample.dart';
import 'package:flutter_samples/core/shared/presentation/widgets/sample_card.dart';

class SamplesScreen extends StatelessWidget {
  const SamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/samples/broco.png'),
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FlutterLogo(size: 25),
          )
        ],
        title: const Text('Flutter Samples'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: Sample.samples.length,
        itemBuilder: (_, index) {
          final sample = Sample.samples[index];
          return SampleCard(
            sample: sample,
            index: Sample.samples.length - index,
          );
        },
      ),
    );
  }
}
