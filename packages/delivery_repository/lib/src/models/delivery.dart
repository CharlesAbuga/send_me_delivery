import 'package:delivery_repository/src/entities/delivery_entity.dart';

class Delivery {
  String userId;
  String deliveryNumber;
  String? itemName;
  DateTime deliveryDate;
  String deliveryStatus;
  String deliveryAddress;
  String deliveryType;
  String deliveryCounty;
  String deliveryPrice;
  int deliveryWeight;
  String senderCounty;

  String recipientName;
  String recipientPhone;
  String recipientEmail;

  String senderName;
  String senderPhone;
  String senderEmail;

  Delivery(
      {required this.userId,
      required this.deliveryNumber,
      required this.deliveryDate,
      required this.deliveryStatus,
      required this.deliveryAddress,
      required this.recipientName,
      required this.recipientPhone,
      required this.recipientEmail,
      required this.senderName,
      required this.senderPhone,
      required this.senderEmail,
      required this.deliveryType,
      required this.deliveryCounty,
      required this.deliveryPrice,
      required this.deliveryWeight,
      required this.senderCounty,
      this.itemName});

  static var empty = Delivery(
      userId: '',
      deliveryNumber: '',
      deliveryDate: DateTime.now(),
      deliveryStatus: '',
      deliveryAddress: '',
      recipientName: '',
      recipientPhone: '',
      recipientEmail: '',
      senderName: '',
      senderPhone: '',
      senderEmail: '',
      deliveryType: '',
      deliveryCounty: '',
      deliveryPrice: '',
      senderCounty: '',
      deliveryWeight: 0,
      itemName: '');
  Delivery copyWith(
      {String? userId,
      String? deliveryNumber,
      DateTime? deliveryDate,
      String? deliveryStatus,
      String? deliveryAddress,
      String? recipientName,
      String? recipientPhone,
      String? recipientEmail,
      String? senderName,
      String? senderPhone,
      String? senderEmail,
      String? deliveryType,
      String? deliveryCounty,
      String? deliveryPrice,
      String? senderCounty,
      int? deliveryWeight,
      String? itemName}) {
    return Delivery(
        userId: userId ?? this.userId,
        deliveryNumber: deliveryNumber ?? this.deliveryNumber,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryStatus: deliveryStatus ?? this.deliveryStatus,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        recipientName: recipientName ?? this.recipientName,
        recipientPhone: recipientPhone ?? this.recipientPhone,
        recipientEmail: recipientEmail ?? this.recipientEmail,
        senderName: senderName ?? this.senderName,
        senderPhone: senderPhone ?? this.senderPhone,
        senderEmail: senderEmail ?? this.senderEmail,
        deliveryType: deliveryType ?? this.deliveryType,
        deliveryCounty: deliveryCounty ?? this.deliveryCounty,
        deliveryPrice: deliveryPrice ?? this.deliveryPrice,
        senderCounty: senderCounty ?? this.senderCounty,
        deliveryWeight: deliveryWeight ?? this.deliveryWeight,
        itemName: itemName ?? this.itemName);
  }

  bool get isEmpty => this == Delivery.empty;
  bool get isNotEmpty => this != Delivery.empty;

  DeliveryEntity toEntity() {
    return DeliveryEntity(
        userId: userId,
        deliveryNumber: deliveryNumber,
        deliveryDate: deliveryDate,
        deliveryStatus: deliveryStatus,
        deliveryAddress: deliveryAddress,
        recipientName: recipientName,
        recipientPhone: recipientPhone,
        recipientEmail: recipientEmail,
        senderName: senderName,
        senderPhone: senderPhone,
        senderEmail: senderEmail,
        deliveryType: deliveryType,
        deliveryCounty: deliveryCounty,
        senderCounty: senderCounty,
        deliveryPrice: deliveryPrice,
        deliveryWeight: deliveryWeight,
        itemName: itemName);
  }

  static Delivery fromEntity(DeliveryEntity entity) {
    return Delivery(
        userId: entity.userId,
        deliveryNumber: entity.deliveryNumber,
        deliveryDate: entity.deliveryDate,
        deliveryStatus: entity.deliveryStatus,
        deliveryAddress: entity.deliveryAddress,
        recipientName: entity.recipientName,
        recipientPhone: entity.recipientPhone,
        recipientEmail: entity.recipientEmail,
        senderName: entity.senderName,
        senderPhone: entity.senderPhone,
        senderEmail: entity.senderEmail,
        deliveryType: entity.deliveryType,
        deliveryCounty: entity.deliveryCounty,
        senderCounty: entity.senderCounty,
        deliveryPrice: entity.deliveryPrice,
        itemName: entity.itemName,
        deliveryWeight: entity.deliveryWeight);
  }
}
