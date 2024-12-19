import 'package:delivery_repository/delivery_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:send_me_deliveries/convert_icon.dart';

class DeliveryDetails extends StatelessWidget {
  final Delivery delivery;
  const DeliveryDetails({super.key, required this.delivery});

  String convertIcon() {
    switch (delivery.deliveryType) {
      case 'Document':
        return 'assets/images/document-1-svgrepo-com (1).svg';
      case 'Electronic':
        return 'assets/images/computer-device-electronics-svgrepo-com.svg';
      case 'Clothes':
        return 'assets/images/clothes-svgrepo-com.svg';
      case 'Documents':
        return 'assets/images/document-1-svgrepo-com (1).svg';
      case 'Cosmetic':
        return 'assets/images/cosmetic-svgrepo-com.svg';
      case 'Household':
        return 'assets/images/chair-furniture-household-interior-sofa-svgrepo-com.svg';

      default:
        return 'assets/images/add-row-svgrepo-com.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: SvgPicture.asset(
                    convertIcon(),
                    height: 20,
                    width: 20,
                  ),
                ),
                title: Text(delivery.deliveryType),
                subtitle: Text(delivery.deliveryNumber),
              ),
              ListTile(
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Icon(
                        CupertinoIcons.clock,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 20,
                      ),
                      Text(
                        ' Delivered On:   ',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      Text(
                        '${DateFormat('dd MMM yyyy').format(delivery.deliveryDate)}',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(child: Icon(CupertinoIcons.money_dollar)),
                title: Text('Ksh: ${delivery.deliveryPrice}'),
                subtitle:
                    Text('Weight: ${delivery.deliveryWeight.toString()} Kg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        shape: BoxShape.rectangle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.map,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text("From:  ${delivery.senderCounty}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                width: 0.5, // Width of the vertical line
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                color:
                                    Colors.black, // Color of the vertical line
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text("To:  ${delivery.deliveryCounty}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        shape: BoxShape.rectangle,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.person,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 40,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text("From:  ${delivery.recipientName}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Container(
                                width: 0.5, // Width of the vertical line
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                color:
                                    Colors.black, // Color of the vertical line
                              ),
                            ),
                            Row(
                              children: [
                                Text("To:  ${delivery.senderName}",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Other Details",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              ),
              Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.pending,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(delivery.deliveryStatus),
                  ),
                  ListTile(
                    leading: Text('Recipient\'s Phone',
                        style: TextStyle(fontSize: 15)),
                    title: Text(delivery.senderPhone),
                  ),
                  ListTile(
                    leading:
                        Text('Recipient Email', style: TextStyle(fontSize: 15)),
                    title: Text(delivery.senderEmail),
                  ),
                  ListTile(
                    leading:
                        Text('Sender\'s Phone', style: TextStyle(fontSize: 15)),
                    title: Text(delivery.recipientPhone),
                  ),
                  ListTile(
                    leading:
                        Text('Sender\'s Email', style: TextStyle(fontSize: 15)),
                    title: Text(delivery.recipientEmail),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
