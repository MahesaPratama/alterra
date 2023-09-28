import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile_flutter/constants/constant.dart';
import 'package:mobile_flutter/domain/entities/product.dart';
import 'package:mobile_flutter/domain/entities/product_checkout.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_bloc.dart';
import 'package:mobile_flutter/presentation/bloc/create_order/create_order_event.dart';
import 'package:mobile_flutter/presentation/widgets/button_widget.dart';
import 'package:mobile_flutter/presentation/widgets/text_field_widget.dart';

class OrderPageCustomMenu extends StatefulWidget {
  final Product product;
  const OrderPageCustomMenu({
    super.key,
    required this.product,
  });

  @override
  State<OrderPageCustomMenu> createState() => _OrderPageCustomMenuState();
}

class _OrderPageCustomMenuState extends State<OrderPageCustomMenu> {
  final TextEditingController _notes = TextEditingController();

  int quantity = 0;
  String? notes;

  @override
  void initState() {
    super.initState();
    final state = context.read<CreateOrderBloc>().state.productsCheckout;
    int getProductCheckoutQuantityById(
        List<ProductCheckout> products, int productId) {
      for (var product in products) {
        if (product.productId == productId) {
          return product.quantity;
        }
      }
      return 0;
    }

    String? getProductCheckoutNotesById(
        List<ProductCheckout> products, int productId) {
      for (var product in products) {
        if (product.productId == productId) {
          return product.notes;
        }
      }
      return null;
    }

    quantity = getProductCheckoutQuantityById(state, widget.product.id);
    notes = getProductCheckoutNotesById(state, widget.product.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      appBar: AppBar(
        backgroundColor: AppColor.kWhite,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.kBlack),
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.product.name,
                  style: context.textTheme.titleSmall!.bold,
                ),
                Text(
                  'Custom Menu',
                  style: context.textTheme.labelLarge!,
                )
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.h20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: CachedNetworkImage(
                  imageUrl: widget.product.image,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.clear),
                  ),
                  height: 333,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap.h48,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Notes',
                style: context.textTheme.titleSmall!.semiBold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Optional',
                style: context.textTheme.labelLarge,
              ),
            ),
            Gap.h12,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFieldWidget(
                controller: _notes,
                maxLines: null,
                hintText: notes,
              ),
            ),
            Gap.h96,
            const Divider(
              thickness: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total Items:',
                    style: context.textTheme.titleSmall!.semiBold,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: quantity > 0
                            ? () {
                                setState(() {
                                  quantity--;
                                });
                              }
                            : () {},
                        icon: const Icon(FontAwesome.minus),
                      ),
                      Gap.w20,
                      Text(
                        quantity.toString(),
                        style: context.textTheme.titleLarge,
                      ),
                      Gap.w20,
                      IconButton(
                        onPressed:
                            // () {},
                            quantity >= 0
                                ? () {
                                    setState(() {
                                      quantity++;
                                    });
                                  }
                                : () {},
                        icon: const Icon(FontAwesome.plus),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              color: AppColor.kBlack,
              height: 120,
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: 35,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subtotal',
                        style: context.textTheme.labelLarge!.white,
                      ),
                      Text(
                        (quantity * widget.product.price).formatCurrency(),
                        style: context.textTheme.titleMedium!.white.medium,
                      ),
                    ],
                  ),
                  ButtonWidget(
                    label: 'Order',
                    width: 200,
                    onTap: () {
                      context.read<CreateOrderBloc>().add(
                            ProductOrderEvent(
                              productCheckout: ProductCheckout(
                                productId: widget.product.id,
                                name: widget.product.name,
                                image: widget.product.image,
                                price: widget.product.price,
                                quantity: quantity,
                                totalPrice: quantity * widget.product.price,
                                notes: _notes.text,
                              ),
                            ),
                          );
                      context.pop();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget radioList(
  //   String title,
  // ) =>
  //     RadioListTile(
  //       title: Text(
  //         title,
  //         style: AppFont.paragraphReguler,
  //       ),
  //       value: title,
  //       groupValue: _selectedRadioValue,
  //       onChanged: (value) {
  //         setState(() {
  //           _selectedRadioValue = value.toString();
  //         });
  //       },
  //       controlAffinity: ListTileControlAffinity.trailing,
  //     );

  // Widget checkBoxList(
  //   String title,
  // ) =>
  //     CheckboxListTile(
  //       title: Text(
  //         title,
  //         style: AppFont.paragraphReguler,
  //       ),
  //       value: _selectedCheckBoxValue.contains(title),
  //       onChanged: (value) {
  //         setState(() {
  //           if (value!) {
  //             _selectedCheckBoxValue.add(title);
  //           } else {
  //             _selectedCheckBoxValue.remove(title);
  //           }
  //         });
  //       },
  //     );
}
