import 'package:fast_buy/core/utils/services/store.dart';
import 'package:fast_buy/core/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/styles.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../models/product.dart';
import '../../login_and_signup/widgets/custom_text_form_field_with_title.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

late String pName, pDescription, pCategory, pQuantity, pPrice, pimageUrl;

class _AddProductViewState extends State<AddProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 24, right: 24, top: 50, bottom: 20),
        child: ListView(
          children: [
             Text(
              'Add Product',
              style: Styles.styleSemiBold32,
            ),
            const SizedBox(
              height: 35,
            ),
            CustomTextFormFieldWithTitle(
              labelText: "Product Name",
              controller: null,
              onChanged: (value) {
                pName = value;
              },
            ),
            CustomTextFormFieldWithTitle(
              labelText: "Product Description",
              controller: null,
              onChanged: (value) {
                pDescription = value;
              },
            ),
            CustomTextFormFieldWithTitle(
              labelText: "Product Quantity",
              controller: null,
              onChanged: (value) {
                pQuantity = value;
              },
            ),
            CustomTextFormFieldWithTitle(
              labelText: "Product Price",
              controller: null,
              onChanged: (value) {
                pPrice = value;
              },
            ),
            CustomTextFormFieldWithTitle(
              labelText: "Product ImageUrl",
              controller: null,
              onChanged: (value) {
                pimageUrl = value;
              },
            ),
            CustomTextFormFieldWithTitle(
              labelText: "Product Category",
              controller: null,
              onChanged: (value) {
                pCategory = value;
              },
            ),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
              onTap: () {
                try {
                  Store().addProduct(
                    Product(
                      pName: pName,
                      pDescription: pDescription,
                      pQuantity: int.parse(pQuantity),
                      pPrice: double.parse(pPrice),
                      pimageUrl: pimageUrl,
                      pCategory: pCategory,
                    ),
                  );
                  showSnackBar(context, '$pName added successfully');
                } catch (e) {
                  showSnackBar(context, 'There were error');
                }
              },
              buttonName: 'ADD',
            ),
          ],
        ),
      ),
    );
  }
}
