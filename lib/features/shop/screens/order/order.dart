import 'package:ecomm/common/styles/padding.dart';
import 'package:ecomm/common/widgets/appbar/appbar.dart';
import 'package:ecomm/features/shop/screens/order/widgets/orders_list.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(
        showBackArrow: true,
        title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(
          padding: UPadding.screenPadding,
        child: UOrdersListItems(),
      ),
    );
  }
}
