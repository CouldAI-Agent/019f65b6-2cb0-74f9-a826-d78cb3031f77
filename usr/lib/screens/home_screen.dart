import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/mock_data.dart';
import 'package:flutter_application_1/models/perfume.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final perfumes = mockPerfumes;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'L\\'ESSENCE',
          style: TextStyle(letterSpacing: 4.0, fontWeight: FontWeight.w300),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth > 900 ? 4 : (constraints.maxWidth > 600 ? 3 : 2);
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 0.65,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: perfumes.length,
            itemBuilder: (context, index) {
              final perfume = perfumes[index];
              return _PerfumeCard(perfume: perfume);
            },
          );
        },
      ),
    );
  }
}

class _PerfumeCard extends StatelessWidget {
  final Perfume perfume;
  const _PerfumeCard({required this.perfume});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: perfume);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
                ],
              ),
              child: const Center(
                child: Icon(Icons.water_drop_outlined, size: 48, color: Colors.black54),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            perfume.brand,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            perfume.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            '\$${perfume.price.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
