import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';
import '../../../models/product.dart';
import 'custom_details_view_app_bar.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDetailsViewAppBar(product: product),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 341 / 368.53,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.pimageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.pName,
              style: Styles.styleSemiBold32.copyWith(fontSize: 24),
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amberAccent[400],
                ),
                // (4321.12345678).toStringAsFixed(3);  // 4321.123.
                Text(
                  '${(product.reviewsSum! / product.reviewersNum!).toStringAsFixed(1)}/5',
                  style: Styles.styleMedium16,
                ),
                Text(
                  ' (${product.reviewersNum} reviews)',
                  style: Styles.styleMedium16.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              product.pDescription,
              style: Styles.styleRegular16.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
