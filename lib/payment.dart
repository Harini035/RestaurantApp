import 'package:flutter/material.dart';
import 'package:paystack_manager/paystack_pay_manager.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'cartmodel.dart';

class Payment extends StatefulWidget {
 // Payment({required Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String get amt => ScopedModel.of<CartModel>(context,
      rebuildOnChange: true).totalCartValue.toString();
  int get amt1 => ScopedModel.of<CartModel>(context,
      rebuildOnChange: true).totalCartValue.toInt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: MaterialButton(
              onPressed: () => _checkPayment(),
              child: Text('Proceed to Payment'),
              color: Colors.blue,
            )),
      ),
    );
  }

  void _checkPayment() {
    try {
      PaystackPayManager(context: context)
        ..setSecretKey("YOUR-SECRET-KEY")
      // ..setCompanyAssetImage(Image(image: NetworkImage("YOUR-IMAGE-URL")))
        ..setAmount(amt1)
        ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
        ..setCurrency("Rs")
        ..setEmail("restaurant@gmail.com")
        ..setMetadata(
          {
            "custom_fields": [
              {
                "value": "TechWithSam",
                "display_name": "Payment_to",
                "variable_name": "Payment_to"
              }
            ]
          },
        )
        ..onSuccesful(_onPaymentSuccessful)
        ..onPending(_onPaymentPending)
        ..onFailed(_onPaymentFailed)
        ..onCancel(_onCancel)
        ..initialize();
    } catch (error) {
      print('Payment Error ==> $error');
    }
  }

  void _onPaymentSuccessful(Transaction transaction) {
    print('Transaction succesful');
    print(
        "Transaction message ==> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentPending(Transaction transaction) {
    print('Transaction Pending');
    print("Transaction Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentFailed(Transaction transaction) {
    print('Transaction Failed');
    print("Transaction message ==> ${transaction.message}");
  }

  void _onCancel(Transaction transaction) {
    print('Transaction Cancelled');
  }
}