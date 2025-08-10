import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final String? imgUrl;

  const CategoryButton({
    super.key,
    required this.title,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 223, 235, 238),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imgUrl != null && imgUrl!.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imgUrl!,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.image_outlined,
                        size: 24,
                        color: Colors.grey,
                      );
                    },
                  ),
                )
              : const Icon(Icons.image_outlined, size: 24, color: Colors.grey),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}