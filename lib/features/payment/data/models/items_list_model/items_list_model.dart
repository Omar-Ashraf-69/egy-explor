import 'item.dart';

class OrderItemsListModel {
  List<OrderItemModel>? items;

  OrderItemsListModel({this.items});

  factory OrderItemsListModel.fromJson(Map<String, dynamic> json) {
    return OrderItemsListModel(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
