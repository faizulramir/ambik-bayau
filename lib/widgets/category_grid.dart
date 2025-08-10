import 'package:flutter/material.dart';
import 'category_button.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // First row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CategoryButton(title: 'Food'),
            CategoryButton(title: 'Car'),
            CategoryButton(title: 'Mart'),
            CategoryButton(title: 'Grocery'),
          ],
        ),
        const SizedBox(height: 8),
        // Second row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CategoryButton(title: 'Express'),
            CategoryButton(title: 'Dine Out'),
            CategoryButton(title: 'Prepaid'),
            CategoryButton(title: 'All'),
          ],
        ),
      ],
    );
  }
}