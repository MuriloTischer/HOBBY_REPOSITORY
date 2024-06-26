// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:greengrocer_app/src/config/custom_colors.dart';
import 'package:greengrocer_app/src/models/cart_item_model.dart';
import 'package:greengrocer_app/src/pages/common_widgets/quantity_widget.dart';
import 'package:greengrocer_app/src/services/util_services.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;

  const CartTile({
    Key? key,
    required this.cartItem,
    required this.remove,
  }) : super(key: key);

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilServices utilServices = UtilServices();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
//! IMAGEM
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
//! TITULO
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
//! TOTAL
        subtitle: Text(
          utilServices.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
//! QUANTIDADE
        trailing: QuantityWidget(
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: ((quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if (quantity == 0) {
                //remover item do carrinho
                widget.remove(widget.cartItem);
              }
            });
          }),
          isRemovable: true,
        ),
      ),
    );
  }
}
