import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../models/product.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Row(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: CustomImage(
                imageUrl: product.pimageUrl,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.pName,
                    style: Styles.styleSemiBold32.copyWith(fontSize: width < 380 ? 12 : 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amberAccent[400],
                        size: 16,
                      ),
                      Text(
                        '${(product.reviewsSum! / product.reviewersNum!).toStringAsFixed(1)}/5',
                        style: Styles.styleRegular16.copyWith(fontSize: width < 380 ? 8 : 12),
                      ),
                      Text(
                        ' (${product.reviewersNum} reviews)',
                        style: Styles.styleRegular16.copyWith(
                          fontSize: width < 380 ? 8 : 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'EG ${product.pPrice}',
                        style: Styles.styleSemiBold32.copyWith(fontSize: width < 380 ? 10 : 14),
                      ),
                      const Spacer(),
                      Text(
                        '${product.pQuantity}',
                        style: Styles.styleSemiBold32.copyWith(fontSize: width < 380 ? 10 : 14),
                      ),
                    ],
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
