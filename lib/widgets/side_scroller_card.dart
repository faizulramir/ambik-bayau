import 'package:flutter/material.dart';

class SideScrollerCard extends StatelessWidget {
  final String shopName;
  final String distance;
  final String discount;
  final String? imgUrl;

  const SideScrollerCard({
    super.key,
    required this.shopName,
    required this.distance,
    this.discount = '',
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image on top
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: imgUrl != null && imgUrl!.isNotEmpty
                  ? Image.network(
                      imgUrl!,
                      width: 140,
                      height: 140,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.image_outlined,
                          size: 40,
                          color: Colors.grey,
                        );
                      },
                    )
                  : const Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: Colors.grey,
                    ),
            ),
          ),
          const SizedBox(height: 6),
          // Shop name/title
          SizedBox(
            height:
                32, // Fixed height for 2 lines (12px font * 1.33 line height * 2 lines)
            child: Text(
              shopName,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                height: 1.33, // Line height multiplier
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 2),
          // Distance with 'km'
          Text(
            '$distance km',
            style: const TextStyle(fontSize: 10, color: Colors.black),
          ),
          // Discount card with icon (only show if not empty)
          if (discount.isNotEmpty) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_offer,
                    size: 10,
                    color: Colors.orange.shade600,
                  ),
                  const SizedBox(width: 3),
                  Text(
                    '$discount% off',
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
