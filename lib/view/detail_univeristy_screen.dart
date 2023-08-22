import 'package:flutter/material.dart';
import 'package:test_dataon/models/university_model.dart';

class DetailUniversityScreen extends StatelessWidget {
  const DetailUniversityScreen({super.key, this.universityModel});

  final UniversityModel? universityModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Nama Universitas'),
            Text(
              universityModel?.name ?? '',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text('Negara'),
            Text(universityModel?.country ?? ''),
            const SizedBox(
              height: 12,
            ),
            const Text('Website'),
            Text(universityModel?.webPages?.first ?? '')
          ],
        ),
      ),
    );
  }
}
