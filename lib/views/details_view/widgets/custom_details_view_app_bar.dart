import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/styles.dart';

class CustomDetailsViewAppBar extends StatefulWidget {
  const CustomDetailsViewAppBar({
    super.key,
  });

  @override
  State<CustomDetailsViewAppBar> createState() =>
      _CustomDetailsViewAppBarState();
}

class _CustomDetailsViewAppBarState extends State<CustomDetailsViewAppBar> {
  bool _isFav = false;
  @override
  Widget build(BuildContext context) {
    return Row(
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
            _isFav ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
            color: Colors.black,
            size: 28,
          ),
          onPressed: () {
            _isFav = !_isFav;
            setState(() {});
          },
        ),
      ],
    );
  }
}