import 'package:fast_buy/models/user_order.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/styles.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
    required this.order,
  });
  final UserOrder order;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          order.uName,
                          style: Styles.styleSemiBold32.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Text(
                          'Items: ${order.producsList.length}',
                          style: Styles.styleSemiBold32.copyWith(
                            fontSize: 18,
                            color: const Color.fromARGB(184, 255, 255, 255),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      order.uPhone,
                      style: Styles.styleMedium16.copyWith(
                          color: const Color.fromARGB(188, 255, 255, 255)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Text(
                      order.uAddress ?? 'Not defined yet',
                      style: Styles.styleRegular16.copyWith(
                        color: Colors.white70,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
