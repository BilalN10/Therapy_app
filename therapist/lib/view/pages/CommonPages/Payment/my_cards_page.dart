// ignore_for_file: missing_required_param

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:therapist/model/data.dart';
import 'package:therapist/view/constants.dart';
import 'package:therapist/view/pages/CommonPages/Payment/payPalMethode.dart';
import 'package:therapist/view/size_config.dart';
import 'package:therapist/view/widgets/heading_tile.dart';
import 'package:therapist/view/widgets/my_button.dart';
import 'package:get/get.dart';

import 'bankPaymentMethod.dart';

class MyCardsPage extends StatefulWidget {
  @override
  _MyCardsPageState createState() => _MyCardsPageState();
}

class _MyCardsPageState extends State<MyCardsPage> {
  String dropdownValue = 'Visa Card';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        elevation: 1,
        backgroundColor: kAppBarBGColor,
        title: Text(
          "My Cards",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: kAppBarTitleSize,
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const GreyHeadingTile(title: 'Active Cards'),
            SizedBox(
              height: 220,
              width: SizeConfig.screenWidth,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myCards.length,
                  itemBuilder: (context, index) {
                    return CreditCardWidget(
                      width: SizeConfig.screenWidth * 0.92,
                      cardBgColor: kPrimaryColor,
                      cardNumber: myCards[index].cardNumber,
                      expiryDate: myCards[index].expiryDate,
                      cardHolderName: myCards[index].cardHolderName,
                      cvvCode: myCards[index].cvvCode,
                      showBackView:
                          false, //true when you want to show cvv(back) view
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Select Payment methode"),
                  DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    //  iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    // underline: Container(
                    //   height: 2,
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>[
                      'Paypal',
                      'Bank Account',
                      'Visa Card',
                      "Amex Card",
                      "Master Card",
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            const GreyHeadingTile(title: 'Add Payment Inforamation'),
            dropdownValue == "Bank"
                ? BankMethode()
                : dropdownValue == "Paypal"
                    ? PayPalMethode()
                    : CreditCardForm(
                        formKey: _formKey, // Required
                        onCreditCardModelChange:
                            (CreditCardModel data) {}, // Required
                        themeColor: Colors.red,
                        obscureCvv: true,
                        obscureNumber: true,
                        cardNumberDecoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              //  width: 1,
                            ),
                          ),
                          labelText: 'Number',
                          hintText: 'XXXX XXXX XXXX XXXX',
                        ),
                        expiryDateDecoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              //  width: 1,
                            ),
                          ),
                          labelText: 'Expiration Date',
                          hintText: 'XX/XX',
                        ),
                        cvvCodeDecoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              //     width: 1,
                            ),
                          ),
                          labelText: 'CVV',
                          hintText: 'XXX',
                        ),
                        cardHolderDecoration: const InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              //     width: 1,
                            ),
                          ),
                          labelText: 'Card Holder Name',
                        ),
                      ),
            const SizedBox(
              height: kDefaultPadding * 2,
            ),
            MyButton(
              label: "Add Card",
              onTap: () {},
            ),
            const SizedBox(
              height: kDefaultPadding * 3,
            ),
          ],
        ),
      ),
    );
  }
}
