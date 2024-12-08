import 'package:flutter/material.dart';
import 'package:leqaa_app/core/extensions/assets_widgets.dart';
import 'package:moyasar/moyasar.dart';

class MoyasaraScreen extends StatelessWidget {
  MoyasaraScreen({super.key});

  final paymentConfig = PaymentConfig(
    publishableApiKey: 'pk_test_96Nu6hVyexUsW9K6L22tTAiVn8X7vfmVecVZGRx9',
    amount: 25758, // SAR 257.58 (amount in the smallest currency unit, e.g., halalas)
    description: 'order #1324',
    metadata: {'size': '250g'},
    creditCard: CreditCardConfig(saveCard: true, manual: false),
    applePay: ApplePayConfig(
      merchantId: 'YOUR_MERCHANT_ID',
      label: 'YOUR_STORE_NAME',
      manual: false,
    ),
  );

  void onPaymentResult(BuildContext context, result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          //AppRoutes.routeTo(context, const PaymentSuccessScreen());
          break;
        case PaymentStatus.failed:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Payment failed. Please try again.')),
          );
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Payment status: ${result.status}')),
          );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid payment response.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            22.hSize,
            ApplePay(
              config: paymentConfig,
              onPaymentResult: (result) => onPaymentResult(context, result),
            ),
            const Text("or"),
            CreditCard(
              config: paymentConfig,
              onPaymentResult: (result) => onPaymentResult(context, result),
            ),
          ],
        ),
      ),
    );
  }
}

/*
for test EX:
ra na
4111 1111 1111 1111
26/12
123
 */