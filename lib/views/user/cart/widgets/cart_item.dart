import 'package:fast_buy/views/user/cart/cart_view.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../models/product.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    super.key,
    required this.product,
    required this.pIndex,
    required this.quantity,
  });
  final Product product;
  final int pIndex;
  final int quantity;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _quantity = 1;

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
                product: widget.product,
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
                    widget.product.pName,
                    style: Styles.styleSemiBold32.copyWith(fontSize: 16),
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
                        '${(widget.product.reviewsSum! / widget.product.reviewersNum!).toStringAsFixed(1)}/5',
                        style: Styles.styleRegular16.copyWith(fontSize: 12),
                      ),
                      Text(
                        ' (${widget.product.reviewersNum} reviews)',
                        style: Styles.styleRegular16.copyWith(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        'EG ${widget.product.pPrice}',
                        style: Styles.styleSemiBold32.copyWith(fontSize: 14),
                      ),
                      const Spacer(),
                      if (_quantity > 1)
                        IconButton(
                          icon: const Icon(Icons.minimize),
                          iconSize: 24,
                          padding: const EdgeInsets.only(bottom: 12),
                          onPressed: () {
                            _quantity--;
                            setState(() => cartList[widget.pIndex]
                                .update('quantity', (value) => _quantity));
                          },
                        ),
                      Text(
                        '$_quantity',
                        style: Styles.styleSemiBold32.copyWith(fontSize: 14),
                      ),
                      _quantity <= widget.product.pQuantity
                          ? IconButton(
                              icon: const Icon(Icons.add),
                              iconSize: 24,
                              onPressed: () {
                                _quantity++;
                                setState(() => cartList[widget.pIndex]
                                    .update('quantity', (value) => _quantity));
                              },
                            )
                          : const SizedBox(
                              width: 24,
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
