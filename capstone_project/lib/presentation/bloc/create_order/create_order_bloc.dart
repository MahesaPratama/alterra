import 'package:mobile_flutter/domain/entities/product_checkout.dart';

import 'create_order_event.dart';
import 'create_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  CreateOrderBloc() : super(CreateOrderState.initial()) {
    on<NameOrderEvent>((event, emit) {
      emit(state.copyWith(
        name: event.name,
        takeOrder: event.takeOrder,
        tableNumber: event.tableNumber ?? 0,
      ));
    });

    on<ProductOrderEvent>((event, emit) {
      List<ProductCheckout> products = [];
      products.addAll(state.productsCheckout);
      products.add(event.productCheckout);

      List<ProductCheckout> mergeProductsWithSameId(
          List<ProductCheckout> products) {
        final Map<int, ProductCheckout> mergedProducts = {};
        for (var product in products) {
          final int productId = product.productId;
          if (mergedProducts.containsKey(productId)) {
            final ProductCheckout existingProduct = mergedProducts[productId]!;
            mergedProducts[productId] = existingProduct.copyWith(
              quantity: event.productCheckout.quantity,
              notes: event.productCheckout.notes,
            );
          } else {
            mergedProducts[productId] = product;
          }
        }
        final List<ProductCheckout> mergedList = mergedProducts.values.toList();
        mergedList.removeWhere((product) {
          return product.productId == event.productCheckout.productId &&
              product.quantity == 0;
        });
        return mergedList;
      }

      final List<ProductCheckout> result = mergeProductsWithSameId(products);
      num subTotal = 0;
      for (var element in result) {
        subTotal += element.totalPrice;
      }
      num grandTotal = subTotal + 12000;

      emit(state.copyWith(
        name: state.name,
        memberCode: state.memberCode,
        takeOrder: state.takeOrder,
        tableNumber: state.tableNumber,
        productsCheckout: mergeProductsWithSameId(products),
        payment: state.payment,
        subTotal: subTotal,
        grandTotal: grandTotal,
      ));
    });

    on<PaymentOrderEvent>((event, emit) {
      emit(state.copyWith(
        name: state.name,
        memberCode: state.memberCode,
        takeOrder: state.takeOrder,
        tableNumber: state.tableNumber,
        productsCheckout: state.productsCheckout,
        payment: event.payment,
        subTotal: state.subTotal,
        grandTotal: state.grandTotal,
      ));
    });

    on<MemberOrderEvent>((event, emit) {
      emit(state.copyWith(
        name: state.name,
        memberCode: event.memberCode,
        takeOrder: state.takeOrder,
        tableNumber: state.tableNumber,
        productsCheckout: state.productsCheckout,
        payment: state.payment,
        subTotal: state.subTotal,
        grandTotal: state.grandTotal,
      ));
    });

    on<ClearOrderEvent>((event, emit) {
      emit(state.copyWith(
        name: '',
        memberCode: '',
        takeOrder: '',
        tableNumber: 0,
        payment: '',
        productsCheckout: [],
        subTotal: 0,
        grandTotal: 0,
      ));
    });
  }
}
