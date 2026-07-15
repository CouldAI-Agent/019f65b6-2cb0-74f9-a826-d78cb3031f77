import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/perfume.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final perfume = ModalRoute.of(context)!.settings.arguments as Perfume?;

    if (perfume == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Perfume not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(perfume.brand, style: const TextStyle(letterSpacing: 2.0, fontWeight: FontWeight.w300)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              color: Colors.white,
              child: const Center(
                child: Icon(Icons.water_drop_outlined, size: 100, color: Colors.black54),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    perfume.name,
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w400, letterSpacing: 1.2),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '\$${perfume.price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    perfume.description,
                    style: const TextStyle(fontSize: 16, height: 1.6, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Added to bag')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                      textStyle: const TextStyle(fontSize: 16, letterSpacing: 2.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                    ),
                    child: const Text('ADD TO BAG'),
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
