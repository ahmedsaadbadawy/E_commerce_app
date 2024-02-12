import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';
import '../../../models/product.dart';

class CustomButtomListTile extends StatelessWidget {
  const CustomButtomListTile({
    super.key,
    required this.product, required this.title, this.onPressed, required this.icon,
  });

  final Product product;
  final String title;
  final VoidCallback? onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -70,
      left: 10,
      right: 10,
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: Card(
          elevation: 2,
          child: ListTile(
            tileColor: Colors.white,
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              'Price',
              style: Styles.styleMedium16.copyWith(color: Colors.grey[600]),
            ),
            subtitle: Text(
              'EG ${product.pPrice}',
              style: Styles.styleSemiBold32.copyWith(fontSize: 24),
            ),
            trailing: TextButton.icon(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                fixedSize: const Size(180, 58),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: Icon(icon),
              onPressed: onPressed,
              label: Text(
                title,
                style: Styles.styleMedium16.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
