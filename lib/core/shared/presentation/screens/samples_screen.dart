import 'package:flutter/material.dart';
import 'package:flutter_samples/core/shared/domain/entities/sample.dart';
import 'package:flutter_samples/core/shared/presentation/widgets/sample_card.dart';
import 'package:google_fonts/google_fonts.dart';

class SamplesScreen extends StatelessWidget {
  const SamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/projects/broco.png'),
            ),
          ),
        ),
        title: Text(
          'Brocodev Projects',
          style: GoogleFonts.poppins(
            color: const Color(0xff001800),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: FlutterLogo(size: 25),
          )
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        itemCount: Sample.samples.length,
        itemBuilder: (context, index) {
          final project = Sample.samples[index];
          return SampleCard(
            sample: project,
            index: Sample.samples.length - index,
          );
        },
      ),
    );
  }
}
