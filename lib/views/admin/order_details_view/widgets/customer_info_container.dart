import 'package:flutter/material.dart';

import '../../../../models/user_order.dart';
import 'custom_customer_info_text_row.dart';

class CustomerInfoContainer extends StatelessWidget {
  const CustomerInfoContainer({
    super.key,
    required this.order,
  });

  final UserOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 40,
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            offset: const Offset(10, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 22, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCustomerInfoTextRow(
              title: 'Name: ',
              subTitle: order.uName,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomCustomerInfoTextRow(
              title: 'Phone: ',
              subTitle: order.uPhone,
            ),
            const SizedBox(
              height: 8,
            ),
            CustomCustomerInfoTextRow(
              title: 'Address: ',
              subTitle: order.uAddress ?? 'Undefined yet',
            ),
          ],
        ),
      ),
    );
  }
}
