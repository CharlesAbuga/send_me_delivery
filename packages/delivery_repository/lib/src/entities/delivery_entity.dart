import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class DeliveryEntity extends Equatable {
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

  DeliveryEntity({
    required this.userId,
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
    this.itemName,
    required this.senderCounty,
  });

  Map<String, dynamic> toDocument() {
    return {
      'userId': userId,
      'deliveryNumber': deliveryNumber,
      'deliveryDate': deliveryDate,
      'deliveryStatus': deliveryStatus,
      'deliveryAddress': deliveryAddress,
      'recipientName': recipientName,
      'recipientPhone': recipientPhone,
      'recipientEmail': recipientEmail,
      'senderName': senderName,
      'senderPhone': senderPhone,
      'senderEmail': senderEmail,
      'deliveryType': deliveryType,
      'deliveryCounty': deliveryCounty,
      'deliveryPrice': deliveryPrice,
      'deliveryWeight': deliveryWeight,
      'senderCounty': senderCounty,
      'itemName': itemName,
    };
  }

  static DeliveryEntity fromDocument(Map<String, dynamic> doc) {
    return DeliveryEntity(
      userId: doc['userid'] ?? '',
      deliveryNumber: doc['deliveryNumber'] ?? '',
      deliveryDate: (doc['deliveryDate'] as Timestamp).toDate(),
      deliveryStatus: doc['deliveryStatus'] ?? '',
      deliveryAddress: doc['deliveryAddress'] ?? '',
      recipientName: doc['recipientName'] ?? '',
      recipientPhone: doc['recipientPhone'] ?? '',
      recipientEmail: doc['recipientEmail'] ?? '',
      senderName: doc['senderName'] ?? '',
      senderPhone: doc['senderPhone'] ?? '',
      senderEmail: doc['senderEmail'] ?? '',
      deliveryType: doc['deliveryType'] ?? '',
      deliveryCounty: doc['deliveryCounty'] ?? '',
      deliveryPrice: doc['deliveryPrice'] ?? '',
      deliveryWeight: doc['deliveryWeight'] ?? 0,
      senderCounty: doc['senderCounty'] ?? '',
      itemName: doc['itemName'] ?? '',
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        deliveryNumber,
        deliveryDate,
        deliveryStatus,
        deliveryAddress,
        recipientName,
        recipientPhone,
        recipientEmail,
        senderName,
        senderPhone,
        senderEmail,
        senderCounty,
        deliveryType,
        deliveryCounty,
        deliveryPrice,
        deliveryWeight,
        itemName,
      ];
}
