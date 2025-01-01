import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget newsCard(
  String tittle,
  String? description,
  String pubDate,
  String? imageUrl,
  String? sourceName,
  String category, [
  bool shimmer = false,
]) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: ConstrainedBox(
        constraints:
            const BoxConstraints(maxHeight: 900, minHeight: 500, maxWidth: 350),
        child: Container(
          color: Colors.orange[100],
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              Image.network(
                (imageUrl == null)
                    ? "https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg"
                    : imageUrl,
                width: 350,
                height: 350,
                fit: BoxFit.fill,
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) =>
                    AnimatedCrossFade(
                  firstChild: child,
                  secondChild: Shimmer.fromColors(
                    baseColor: Colors.grey.shade400,
                    highlightColor: Colors.grey.shade700,
                    enabled: true,
                    period: const Duration(seconds: 2),
                    child: Container(
                      width: 350,
                      height: 350,
                      color: Colors.black,
                    ),
                  ),
                  crossFadeState: shimmer ||
                          ((child as Semantics).child as RawImage).image == null
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.error, size: 50, color: Colors.red),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  spacing: 10,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tittle,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                    Text(
                      (description == null) ? "No description" : description,
                      maxLines: 5,
                    ),
                    Text(pubDate),
                    Text(category),
                    Text((sourceName == null) ? "No description" : sourceName),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
