import 'package:fast_buy/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 174,
            width: 161,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 40,
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 0,
                  offset: const Offset(10, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://img.freepik.com/free-psd/isolated-white-t-shirt-front-view_125540-1194.jpg?w=900&t=st=1707509228~exp=1707509828~hmac=335d75dc7f72299427a19c5824176064087a1bff4f97c205debcc7bbb0c452bb',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Product name",
            style: Styles.styleSemiBold32.copyWith(fontSize: 16),
          ),
          Text(
            "EG 1200 - 52%",
            style: Styles.styleMedium16.copyWith(
              fontSize: 12.2,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
