import 'package:flutter/material.dart';

class SideScrollerItem extends StatelessWidget {
  final String title;
  final String topDescription;
  final String? imgUrl;

  const SideScrollerItem({
    super.key,
    required this.title,
    required this.topDescription,
    this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minWidth: 80, maxWidth: 150),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topDescription,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            overflow: TextOverflow.clip,
            maxLines: 1,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 6),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: imgUrl != null && imgUrl!.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          imgUrl!,
                          width: 20,
                          height: 20,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_outlined,
                              size: 12,
                              color: Colors.grey,
                            );
                          },
                        ),
                      )
                    : const Icon(
                        Icons.image_outlined,
                        size: 12,
                        color: Colors.grey,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}