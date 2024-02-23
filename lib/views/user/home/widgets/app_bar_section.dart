import 'package:fast_buy/core/widgets/custom_search_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Discover',
            style: Styles.styleSemiBold32,
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 110,
                height: 53,
                child: CustomSearchTextField(
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 9,
              ),
              SizedBox(
                width: 53,
                height: 53,
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  icon: const Icon(
                    Icons.filter_list,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
