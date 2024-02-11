import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/styles.dart';
import '../../../models/product.dart';

class DetailsViewBody extends StatefulWidget {
  const DetailsViewBody({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<DetailsViewBody> createState() => _DetailsViewBodyState();
}

bool _isFav = false;

class _DetailsViewBodyState extends State<DetailsViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                const Text('Details', style: Styles.styleSemiBold32),
                IconButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: const Size(50, 50),
                  ),
                  icon: Icon(
                    _isFav
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    color: Colors.black,
                    size: 28,
                  ),
                  onPressed: () {
                    _isFav = !_isFav;
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            AspectRatio(
              aspectRatio: 341 / 368.53,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  widget.product.pimageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.product.pName,
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
                  '${(widget.product.reviewsSum! / widget.product.reviewersNum!).toStringAsFixed(1)}/5',
                  style: Styles.styleMedium16,
                ),
                Text(
                  ' (${widget.product.reviewersNum} reviews)',
                  style: Styles.styleMedium16.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.product.pDescription,
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
