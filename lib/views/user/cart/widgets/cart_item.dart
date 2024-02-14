import 'package:fast_buy/views/user/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_image.dart';
import '../../../../models/product.dart';
import '../manager/cart_cubit/cart_cubit.dart';

class CartItem extends StatelessWidget {
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
  Widget build(BuildContext context) {
    int quantity = 1;

    return Card(
      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        child: Row(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: CustomImage(
                product: product,
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
                        '${(product.reviewsSum! / product.reviewersNum!).toStringAsFixed(1)}/5',
                        style: Styles.styleRegular16.copyWith(fontSize: 12),
                      ),
                      Text(
                        ' (${product.reviewersNum} reviews)',
                        style: Styles.styleRegular16.copyWith(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Text(
                            'EG ${product.pPrice}',
                            style:
                                Styles.styleSemiBold32.copyWith(fontSize: 14),
                          ),
                          const Spacer(),
                          if (quantity > 1)
                            IconButton(
                              icon: const Icon(Icons.minimize),
                              iconSize: 24,
                              padding: const EdgeInsets.only(bottom: 12),
                              onPressed: () {
                                total -= product.pPrice;

                                quantity--;
                                cartList[pIndex]
                                    .update('quantity', (value) => quantity);
                                BlocProvider.of<CartCubit>(context)
                                    .cartUpdate();
                              },
                            ),
                          Text(
                            '$quantity',
                            style:
                                Styles.styleSemiBold32.copyWith(fontSize: 14),
                          ),
                          quantity <= product.pQuantity
                              ? IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 24,
                                  onPressed: () {
                                    total += product.pPrice;

                                    quantity++;
                                    cartList[pIndex].update(
                                        'quantity', (value) => quantity);
                                    BlocProvider.of<CartCubit>(context)
                                        .cartUpdate();
                                  },
                                )
                              : const SizedBox(
                                  width: 24,
                                ),
                        ],
                      );
                    },
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
