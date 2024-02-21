import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class OrderDetailsViewAppBar extends StatelessWidget {
  const OrderDetailsViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width / 8,
        ),
        const Text(
          'Order Details',
          style: Styles.styleSemiBold32,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
