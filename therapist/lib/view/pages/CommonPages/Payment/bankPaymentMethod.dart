import 'package:flutter/material.dart ';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';

class BankMethode extends StatelessWidget {
  BankMethode({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CreditCardForm(
      cvvCode: "",
      cardHolderName: "",
      cardNumber: "",
      cursorColor: Colors.red,
      cvvValidationMessage: "",
      dateValidationMessage: "",
      expiryDate: "",

      formKey: _formKey, // Required
      onCreditCardModelChange: (CreditCardModel data) {}, // Required
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
        labelText: 'Card Number',
        hintText: 'XXXX XXXX XXXX XXXX',
      ),
      expiryDateDecoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            //  width: 1,
          ),
        ),
        labelText: 'Expired Date',
        hintText: 'MM/YY',
      ),
      cvvCodeDecoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            //     width: 1,
          ),
        ),
        labelText: 'Secure Code',
        hintText: '',
      ),
      cardHolderDecoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            //     width: 1,
          ),
        ),
        labelText: 'Name on Card',
      ),
    );
  }
}
