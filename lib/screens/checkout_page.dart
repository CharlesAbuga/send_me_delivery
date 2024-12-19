import 'package:delivery_repository/delivery_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:send_me_deliveries/bloc/add_delivery/add_delivery_bloc.dart';
import 'package:send_me_deliveries/screens/home_screen.dart';

class CheckOut extends StatefulWidget {
  final Delivery delivery;
  const CheckOut({super.key, required this.delivery});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  bool isDeliverySuccess = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Out',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSecondary)),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: isDeliverySuccess
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child:
                        Icon(Icons.check_circle, color: Colors.green, size: 50)
                            .animate()
                            .fadeIn(
                              duration: Duration(seconds: 1),
                            ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text('Delivery Added Successfully'),
                  // ElevatedButton(
                  //   style: ElevatedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     backgroundColor: Theme.of(context).colorScheme.secondary,
                  //   ),
                  //   onPressed: () {
                  //     Navigator.pushReplacement(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => HomeScreen()));
                  //   },
                  //   child: const Text('Go Home',
                  //       style: TextStyle(color: Colors.white)),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.secondary),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Back'),
                  ),
                ],
              ),
            )
          : Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_on,
                                        color: Colors.white),
                                    const SizedBox(width: 10),
                                    Text('Delivery Address',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary)),
                                  ],
                                ),
                                Text(widget.delivery.deliveryAddress,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary)),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person_2, color: Colors.white),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Sender\'s Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary),
                                    ),
                                  ],
                                ),
                                Text(
                                  widget.delivery.recipientName,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 15,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.phone, color: Colors.white),
                                    const SizedBox(width: 10),
                                    Text(
                                      'Sender\'s Phone',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary),
                                    ),
                                  ],
                                ),
                                Text(widget.delivery.recipientPhone,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            fontSize: 15,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary)),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.account_balance_wallet,
                                        color: Colors.white),
                                    const SizedBox(width: 10),
                                    Text('Total Amount',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onSecondary)),
                                  ],
                                ),
                                Text(
                                  widget.delivery.deliveryPrice.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontSize: 15,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Item Type',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: widget.delivery.deliveryType,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Item Name and Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: widget.delivery.itemName,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Recipient Name',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: widget.delivery.senderName,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Recipient Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: widget.delivery.senderEmail,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Expected Delivery',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: DateFormat('dd MMM yyyy')
                                  .format(widget.delivery.deliveryDate),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          BlocConsumer<AddDeliveryBloc, AddDeliveryState>(
                            listener: (context, state) {
                              if (state is AddDeliverySuccess) {
                                setState(() {
                                  isDeliverySuccess = true;
                                });
                              }
                            },
                            builder: (context, state) {
                              return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(
                                        MediaQuery.of(context).size.width * 0.9,
                                        50),
                                    backgroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {});
                                    context.read<AddDeliveryBloc>().add(
                                          CreateDelivery(widget.delivery),
                                        );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.check,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface,
                                      ),
                                      Text(
                                        'Confirm Delivery',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .surface),
                                      ),
                                    ],
                                  ));
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
